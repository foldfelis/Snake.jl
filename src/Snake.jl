module Snake

    using Terming
    const T = Terming

    export main

    include("model.jl")
    include("view.jl")
    include("control.jl")

    function App(term_size=(30, 80))
        # event queue
        listener = InputListener()
        event_queue = listener.pipeline[end]

        # model
        ph, pw = term_size
        snake_model = SnakeModel(ph, pw, event_queue)

        # view
        snake_view = SnakeView(snake_model)
        form_view = FormView(term_size, [snake_view])

        app = App(term_size, listener, snake_model, form_view)

        return app
    end

    function main()
        app = App()
        run(app)
    end

end
