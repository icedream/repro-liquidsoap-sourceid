def setup_http(s) =
    id = s.id()

    def on_http_get(_) =
        http.response(status_code=200)
    end

    harbor.http.register.simple(port=8080, method="GET", "/#{id}/test", on_http_get)

    s
end

# just an example source
s = sine()

def example_meta(_) =
    [
        ("test", "Some test metadata"),
    ]
end

# this should set the new source id for s to main
s = metadata.map(id="main", example_meta, s)

# should set up /main/test but the log says /source_0/test is set up instead
s = setup_http(s)

output.dummy(s)
