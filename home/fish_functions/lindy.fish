function lindy
    if test (count $argv) = 1 -a "$argv[1]" = "switch-host"
        set env_file .env.local
        
        if not test -f $env_file
            echo "Error: .env.local file not found in the current directory."
            echo "Please run this command in the directory containing the .env.local file."
            return 1
        end

        set temp_file (mktemp)

        if grep -q '^NEXT_PUBLIC_API_ORIGIN = "http://localhost:3001"' $env_file
            # Switch to ngrok
            sed -e 's/^NEXT_PUBLIC_API_ORIGIN/# NEXT_PUBLIC_API_ORIGIN/' \
                -e 's/^NEXT_PUBLIC_FRONTEND_ORIGIN/# NEXT_PUBLIC_FRONTEND_ORIGIN/' \
                -e 's/^LOCAL_OAUTH_REDIRECT_URL/# LOCAL_OAUTH_REDIRECT_URL/' \
                -e 's/^# NEXT_PUBLIC_API_ORIGIN="https/NEXT_PUBLIC_API_ORIGIN="https/' \
                -e 's/^# NEXT_PUBLIC_API_PUBLIC_ORIGIN/NEXT_PUBLIC_API_PUBLIC_ORIGIN/' \
                -e 's/^# NEXT_PUBLIC_FRONTEND_ORIGIN="https/NEXT_PUBLIC_FRONTEND_ORIGIN="https/' \
                -e 's/^# LOCAL_OAUTH_REDIRECT_URL=ngrok/LOCAL_OAUTH_REDIRECT_URL=ngrok/' \
                -e 's/^# SESSION_COOKIE_DOMAIN/SESSION_COOKIE_DOMAIN/' $env_file > $temp_file
            echo "Switched to ngrok configuration"
        else
            # Switch to local
            sed -e 's/^# NEXT_PUBLIC_API_ORIGIN = "http/NEXT_PUBLIC_API_ORIGIN = "http/' \
                -e 's/^# NEXT_PUBLIC_FRONTEND_ORIGIN = "http/NEXT_PUBLIC_FRONTEND_ORIGIN = "http/' \
                -e 's/^# LOCAL_OAUTH_REDIRECT_URL="localhost"/LOCAL_OAUTH_REDIRECT_URL="localhost"/' \
                -e 's/^NEXT_PUBLIC_API_ORIGIN="https/# NEXT_PUBLIC_API_ORIGIN="https/' \
                -e 's/^NEXT_PUBLIC_API_PUBLIC_ORIGIN/# NEXT_PUBLIC_API_PUBLIC_ORIGIN/' \
                -e 's/^NEXT_PUBLIC_FRONTEND_ORIGIN="https/# NEXT_PUBLIC_FRONTEND_ORIGIN="https/' \
                -e 's/^LOCAL_OAUTH_REDIRECT_URL=ngrok/# LOCAL_OAUTH_REDIRECT_URL=ngrok/' \
                -e 's/^SESSION_COOKIE_DOMAIN/# SESSION_COOKIE_DOMAIN/' $env_file > $temp_file
            echo "Switched to local configuration"
        end

        mv $temp_file $env_file
    else
        echo "Usage: lindy switch-host"
    end
end