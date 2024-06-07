on idle
    tell application "System Events"
        set spotlightVisible to (UI elements enabled)
    end tell
    if spotlightVisible then
        log "Spotlight activated"
    else
        log "Spotlight deactivated"
    end if
    return 1 -- 设置轮询间隔，单位为秒
end idle
