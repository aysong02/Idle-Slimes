function input()
    cursor.x = stat(32) - 1
    cursor.y = stat(33) - 1
    cursor.prevClick = cursor.clicking
    cursor.clicking = stat(34)
end