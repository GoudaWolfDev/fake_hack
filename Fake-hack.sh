#!/bin/bash

# اسم الأداة
echo "Welcome to GoudaHack - The Ultimate Hacking Simulation Tool"
echo "Type any command to start the simulation..."

# دالة لطباعة نصوص وهمية مع رسوميات
function show_animation() {
    clear
    for i in {1..100}; do
        chars=$(cat /dev/urandom | tr -dc 'A-Za-z0-9@#$%^&*()_+[]{}|;:,.<>?/=' | head -c $((RANDOM % 80 + 20)))
        echo -e "\033[0;32m$chars\033[0m"
        sleep 0.05
    done
    echo -e "\033[1;33m[=== Loading... ===]\033[0m"
    sleep 1
}

# دالة لمحاكاة الأوامر الوهمية
function execute_command() {
    case $1 in
        "clear")
            clear
            ;;
        "ls")
            echo "file1.txt  file2.txt  GoudaHack.sh  project_folder"
            sleep 0.5
            ;;
        "ping")
            echo "Pinging 127.0.0.1 with 32 bytes of data:"
            for i in {1..4}; do
                echo "Reply from 127.0.0.1: bytes=32 time<1ms TTL=64"
                sleep 0.5
            done
            ;;
        "top")
            echo "top - 18:42:09 up  2:15,  2 users,  load average: 0.15, 0.20, 0.10"
            echo "Tasks: 123 total,   1 running, 122 sleeping,   0 stopped,   0 zombie"
            echo "%Cpu(s):  5.0 us,  2.0 sy,  0.0 ni, 90.0 id,  3.0 wa,  0.0 hi,  0.0 si,  0.0 st"
            sleep 2
            ;;
        *)
            echo "Executing: $1"
            sleep 1
            show_animation
            echo -e "\033[1;32mOperation $1 completed successfully.\033[0m"
            sleep 1
            ;;
    esac
}

# بدء محاكاة الأداة
while true; do
    read -p "GoudaHack> " user_input
    execute_command "$user_input"
done
