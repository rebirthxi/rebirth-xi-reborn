# Run from repo root
for f in $(find src/ -name '*.h' -or -name '*.cpp'); do clang-format-14 -style=file -i $f; done
