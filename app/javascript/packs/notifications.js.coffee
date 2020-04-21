
class Notifications
    constructor: -> 
        @notifications = $("[data-behavior='notifications']")
        @setup() if @notifications.length > 0
    setup: ->
        $("[data-behavior='notifications-link']").on "click", @handleClick
        setInterval () ->
            $.ajax(
                url: "/notifications.json"
                dataType: "JSON"
                
                method: "GET"
                success: (data) ->
                    items = $.map data, (notification) ->
                        "<div class='dropdown-item' style='font-size: 15px;line-height: 1.6; border-bottom: 0.5px solid grey;'>
                        #{notification.action}
                        <a href= 'http://127.0.0.1:3000/orders/#{notification.order_id}'>Join</a>
                           
                        </div>" 
                    counter = 0
                    for value in data
                        if !value.read_at then counter=counter+1
                    $("[data-behavior= 'notification-item']").html(items)
                    $("[data-behavior='unread-count']").text(counter)
            )
        ,5000

        # $.ajax(
        #     url: "/notifications.json"
        #     dataType: "JSON"
        #     method: "GET"
        #     success: @handleSuccess
        # )
            
    handleClick: (e) => 
        $.ajax(
            url: "/notifications/mark_as_reads"
            dataType: "JSON"
            method: "POST"
            success: -> $("[data-behavior='unread-count']").text(0)
        )

    handleSuccess: (data) =>
        # console.log(data)
        console.log("mohamedeeeeeeeeeee")
        items = $.map data, (notification) ->
            "<div class='dropdown-item' style='font-size: 15px;line-height: 1.6; border-bottom: 0.5px solid grey;'>#{notification.action}</div>" 
        console.log(data.length)
        counter = 0
        for value in data
            if !value.read_at then counter=counter+1
            
        $("[data-behavior= 'notification-item']").html(items)
        $("[data-behavior='unread-count']").text(counter)

        
jQuery -> 
    new Notifications

