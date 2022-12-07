import pathlib, re


VERSION = pathlib.Path("./version").read_text()

for f in pathlib.Path(".").glob("./deployments/*.yml"):
    ver_txt = re.sub(
        r"(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)", VERSION, f.read_text(), count=1
    )
    f.write_text(ver_txt)
print("Kubernetes OAM files ready")
