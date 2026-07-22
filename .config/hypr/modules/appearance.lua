hl.config({
    general = {
        allow_tearing = true,
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,

        col = {
            active_border = "rgba(58a6ffcc)",
            inactive_border = "rgba(30363dee)"
        },

        layout = "scrolling"
    },
    decoration = {
        rounding = 10,
    }
})

hl.curve("meow", { type = "bezier", points = {{0.65, 0}, {0.35, 1}} })

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "meow"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "meow"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "meow"
})

