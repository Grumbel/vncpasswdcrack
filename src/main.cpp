// Copyright (C) 2013 Ingo Ruhnke <grumbel@gmail.com>
//
// This is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This software is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this software; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,
// USA.

#include <iostream>
#include <iterator>
#include <fstream>
#include <vector>

extern "C" {
#include <rfb/d3des.h>
}

static unsigned char d3desObfuscationKey[] = {23,82,107,6,35,78,88,7};

int main(int argc, char** argv)
{
  if (argc < 2)
  {
    std::cerr << "Usage: " << argv[0] << " FILE" << std::endl;
    return 1;
  }
  else
  {
    for(int i = 1; i < argc; ++i)
    {
      std::ifstream fin{argv[i], std::ios::binary};
      if (!fin)
      {
        std::cerr << argv[i] << ": error: couldn't open file" << std::endl;
      }
      else
      {
        std::vector<char> content{std::istreambuf_iterator<char>{fin}, std::istreambuf_iterator<char>{}};

        unsigned char buf[8];
        deskey(d3desObfuscationKey, DE1);
        des(reinterpret_cast<unsigned char*>(content.data()), buf);
        std::cout << argv[i] << ": ";
        std::cout.write(reinterpret_cast<char*>(buf), 8);
        std::cout << std::endl;
      }
    }

    return 0;
  }
}

/* EOF */
