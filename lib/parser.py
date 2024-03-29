from pathlib import Path

p = Path(__file__).with_name('file.txt')

lines = []
file = "iconsax_linear.dart"

with p.with_name(file).open() as f:
    lines = f.readlines()

def write_docs():
    with p.with_name("doc_" + file).open("w") as f:
        for line in lines:
            if "IconData" in line and "=" in line:
                name = line.split("IconData")[1][1:-3]
                f.write(f"/// ![](https://raw.githubusercontent.com/jb3rndt/flutter_iconsax/icon-preview/assets/icon-preview/linear/{name}.png)\n")
            f.write(line)

def extract_statics():
    with p.with_name("statics.txt").open("w") as f:
        for line in lines:
            if "IconData" in line and "=" in line:
                name = line.split("IconData")[1][1:-3]
                f.write(f"const Icon(IconsaxBroken.{name}),\n")


write_docs()
