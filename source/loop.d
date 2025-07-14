import std.range     : empty,front,popFront;
import std.range     : isInputRange;
import std.traits    : isCallable;

void
loop (Whats,See) (ref Whats whats, See see) if (isCallable!See && isInputRange!Whats) {
    for (; !whats.empty; whats.popFront)
        if (auto new_what = see (whats.front))
            whats ~= new_what;
}
