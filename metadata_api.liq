def setup_harbor_metadata_api(~port=21338, s) =
    id = s.id()

    def on_http_get(_) =
        http.response(status_code=200)
    end

    harbor.http.register.simple(port=port, method="GET", "/#{id}/test", on_http_get)

    s
end
