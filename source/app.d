import std.stdio;
import loop : loop;

void 
main () {
	alias What = int;

	// 1
	{
		What
		see (What what) {
			writeln (what);

			if (what == 1)
				return What (10);
			else	
				return What ();
		}

		writeln ("array");
		What[] whats = [1,2,3];
		loop (whats,&see);
	}

	// 2
	{
		writeln ("DList");
		import std.container : DList;

		What
		see (What what) {
			writeln (what);

			if (what == 1)
				return What (10);
			else	
				return What ();
		}

		struct 
		DListForwardRange (What) {
			DList!What _super;
			alias _super this;
			void popFront () { _super.removeFront (); }
			this (ARGS...) (ARGS args) { _super = DList!What (args); }
		}

		auto whats = DListForwardRange!What ([1,2,3]);

		loop (whats,&see);
	}

	// 3
	{
		writeln ("class method");
		class 
		Klass {
			auto
			see (What what) {
				writeln (what);

				if (what == 1)
					return What (10);
				else
					return What ();
			}
		}

		What[] whats = [1,2,3];
		auto   obj   = new Klass ();

		loop (whats,&obj.see);
	}

	// 4
	{
		writeln ("lambda");
		What[] whats = [1,2,3];
		auto   see   = (What what) { writeln (what); return (what == 1) ? What (10) : What (); };

		loop (whats,see);
	}
}
