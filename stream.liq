%include "metadata_api.liq"

s = sine()

def append_encoder_meta(_) =
    [
        ("test", "Some test metadata"),
    ]
end
s = metadata.map(id="main", append_encoder_meta, s)

s = setup_harbor_metadata_api(s)

output.dummy(s)
