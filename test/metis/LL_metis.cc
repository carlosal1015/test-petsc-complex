/*
 * Taken from https://salsa.debian.org/science-team/metis/-/raw/master/debian/tests/build1
*/

#include <iostream>
#include <metis.h>

int main(int argc, char *argv[])
{

  int result;
  // Needed by parmetis
  idx_t nvtxs = 15, ncon = 1;
  idx_t *xadj = NULL, *vsize = NULL, *adjncy = NULL;
  idx_t *vwgt = NULL, *adjwgt = NULL;

  idx_t nparts = 3;
  real_t *tpwgts = NULL, *ubvec = NULL;
  idx_t *options = NULL;
  idx_t objval;
  idx_t part[15];

  std::cout << " Metis example from LiberLocus." << '\n';

  xadj = new idx_t[16];
  adjncy = new idx_t[44];

  xadj[0] = 0;
  xadj[1] = 2;
  xadj[2] = 5;
  xadj[3] = 8;
  xadj[4] = 11;
  xadj[5] = 13;
  xadj[6] = 16;
  xadj[7] = 20;
  xadj[8] = 24;
  xadj[9] = 28;
  xadj[10] = 31;
  xadj[11] = 33;
  xadj[12] = 36;
  xadj[13] = 39;
  xadj[14] = 42;
  xadj[15] = 44;

  adjncy[0] = 1;
  adjncy[1] = 5;
  adjncy[2] = 0;
  adjncy[3] = 2;
  adjncy[4] = 6;
  adjncy[5] = 1;
  adjncy[6] = 3;
  adjncy[7] = 7;
  adjncy[8] = 2;
  adjncy[9] = 4;
  adjncy[10] = 8;
  adjncy[11] = 3;
  adjncy[12] = 9;
  adjncy[13] = 0;
  adjncy[14] = 6;
  adjncy[15] = 10;
  adjncy[16] = 1;
  adjncy[17] = 5;
  adjncy[18] = 7;
  adjncy[19] = 11;
  adjncy[20] = 2;
  adjncy[21] = 6;
  adjncy[22] = 8;
  adjncy[23] = 12;
  adjncy[24] = 3;
  adjncy[25] = 7;
  adjncy[26] = 9;
  adjncy[27] = 13;
  adjncy[28] = 4;
  adjncy[29] = 8;
  adjncy[30] = 14;
  adjncy[31] = 5;
  adjncy[32] = 11;
  adjncy[33] = 6;
  adjncy[34] = 10;
  adjncy[35] = 12;
  adjncy[36] = 7;
  adjncy[37] = 11;
  adjncy[38] = 13;
  adjncy[39] = 8;
  adjncy[40] = 12;
  adjncy[41] = 14;
  adjncy[42] = 9;
  adjncy[43] = 13;

  //  result = METIS_PartGraphRecursive( &nvtxs, &ncon, xadj, adjncy, vwgt,
  //                                     vsize, adjwgt, &nparts, tpwgts,
  //                                     ubvec, options, &objval, part);
  result = METIS_PartGraphKway(&nvtxs, &ncon, xadj, adjncy, vwgt,
                               vsize, adjwgt, &nparts, tpwgts,
                               ubvec, options, &objval, part);

  std::cout << "npart is " << '\n';
  for (int i = 0; i < 15; i++)
  {
    std::cout << part[i] << " ";
  }
  std::cout << '\n';

  delete xadj;
  delete adjncy;

  std::cout << "Metis returned successfully." << '\n';

  return 0;
}
