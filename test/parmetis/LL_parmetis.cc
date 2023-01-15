/*
 * Taken from https://salsa.debian.org/science-team/parmetis/-/raw/master/debian/tests/build1
*/

#include <iostream>
#include <parmetis.h>

int main(int argc, char *argv[])
{

  int result;
  // Needed by parmetis

  idx_t *vtxdist = NULL;
  idx_t *xadj = NULL;
  idx_t *adjncy = NULL;
  idx_t *vwgt = NULL, *adjwgt = NULL;
  idx_t wgtflag = 0;
  idx_t numflag = 0;
  idx_t ncon = 1;
  idx_t nparts = 3;
  real_t *tpwgts = NULL, ubvec;
  idx_t options[4], edgecut;
  idx_t part[5];

  // For AdaptiveRepart
  real_t itr;
  idx_t *vsize = NULL;

  // Start Comm
  // MPI VARIABLES
  int MPI_PROC_ID;
  int MPI_PROC_TOTAL_NUM;
  MPI_Comm comm;
  double TOTAL_TIME_ELAPSED;
  int ierr;
  ierr = MPI_Init(&argc, &argv);
  ierr = MPI_Comm_size(MPI_COMM_WORLD, &MPI_PROC_TOTAL_NUM);
  ierr = MPI_Comm_rank(MPI_COMM_WORLD, &MPI_PROC_ID);
  MPI_Comm_dup(MPI_COMM_WORLD, &comm);
  if (MPI_PROC_ID == 0)
  {
    std::cout << " Parmetis example from LiberLocus." << '\n';
  }
  std::cout << "I am Proc " << MPI_PROC_ID << '\n';
  // Common for every processor
  vtxdist = new idx_t[4];
  // For AdaptiveRepart
  itr = 1000.0;

  vtxdist[0] = 0;
  vtxdist[1] = 5;
  vtxdist[2] = 10;
  vtxdist[3] = 15;

  ubvec = 1.05;

  options[0] = 0;
  options[1] = 0;
  options[2] = 0;
  options[3] = 0;

  part[0] = MPI_PROC_ID;
  part[1] = MPI_PROC_ID;
  part[2] = MPI_PROC_ID;
  part[3] = MPI_PROC_ID;
  part[4] = MPI_PROC_ID;

  tpwgts = new real_t[3];
  //    tpwgts[0] = static_cast<float>(ncon) / static_cast<float>(nparts);
  tpwgts[0] = 1.0 / 3.0;
  tpwgts[1] = 1.0 / 3.0;
  tpwgts[2] = 1.0 / 3.0;
  // Dependent on each processor
  if (MPI_PROC_ID == 0)
  {
    xadj = new idx_t[6];
    adjncy = new idx_t[13];

    xadj[0] = 0;
    xadj[1] = 2;
    xadj[2] = 5;
    xadj[3] = 8;
    xadj[4] = 11;
    xadj[5] = 13;

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
  }
  else if (MPI_PROC_ID == 1)
  {
    xadj = new idx_t[6];
    adjncy = new idx_t[18];

    xadj[0] = 0;
    xadj[1] = 3;
    xadj[2] = 7;
    xadj[3] = 11;
    xadj[4] = 15;
    xadj[5] = 18;

    adjncy[0] = 0;
    adjncy[1] = 6;
    adjncy[2] = 10;
    adjncy[3] = 1;
    adjncy[4] = 5;
    adjncy[5] = 7;
    adjncy[6] = 11;
    adjncy[7] = 2;
    adjncy[8] = 6;
    adjncy[9] = 8;
    adjncy[10] = 12;
    adjncy[11] = 3;
    adjncy[12] = 7;
    adjncy[13] = 9;
    adjncy[14] = 13;
    adjncy[15] = 4;
    adjncy[16] = 8;
    adjncy[17] = 14;
  }
  else if (MPI_PROC_ID == 2)
  {
    xadj = new idx_t[6];
    adjncy = new idx_t[13];

    xadj[0] = 0;
    xadj[1] = 2;
    xadj[2] = 5;
    xadj[3] = 8;
    xadj[4] = 11;
    xadj[5] = 13;

    adjncy[0] = 5;
    adjncy[1] = 11;
    adjncy[2] = 6;
    adjncy[3] = 10;
    adjncy[4] = 12;
    adjncy[5] = 7;
    adjncy[6] = 11;
    adjncy[7] = 13;
    adjncy[8] = 8;
    adjncy[9] = 12;
    adjncy[10] = 14;
    adjncy[11] = 9;
    adjncy[12] = 13;
  }
  if (MPI_PROC_ID == 0)
  {
    std::cout << "parmetis initialized." << '\n';
  }

  //  result = ParMETIS_V3_PartKway( vtxdist, xadj, adjncy, vwgt, adjwgt,
  //                                 &wgtflag, &numflag, &ncon,
  //                                 &nparts, tpwgts, &ubvec, options,
  //                                 &edgecut, part, &comm );
  result = ParMETIS_V3_AdaptiveRepart(vtxdist, xadj, adjncy, vwgt, vsize,
                                      adjwgt, &wgtflag, &numflag, &ncon,
                                      &nparts, tpwgts, &ubvec, &itr, options,
                                      &edgecut, part, &comm);

  if (MPI_PROC_ID == 0)
  {
    std::cout << "parmetis finalized." << '\n';
  }
  MPI_Barrier(MPI_COMM_WORLD);
  if (MPI_PROC_ID == 0)
  {
    std::cout << MPI_PROC_ID << " edgecut " << edgecut << '\n';
    for (int i = 0; i < 5; i++)
    {
      std::cout << MPI_PROC_ID << " " << part[i] << '\n';
    }
  }
  MPI_Barrier(MPI_COMM_WORLD);
  if (MPI_PROC_ID == 1)
  {
    std::cout << MPI_PROC_ID << " edgecut " << edgecut << '\n';
    for (int i = 0; i < 5; i++)
    {
      std::cout << MPI_PROC_ID << " " << part[i] << '\n';
    }
  }
  MPI_Barrier(MPI_COMM_WORLD);
  if (MPI_PROC_ID == 2)
  {
    std::cout << MPI_PROC_ID << " edgecut " << edgecut << '\n';
    for (int i = 0; i < 5; i++)
    {
      std::cout << MPI_PROC_ID << " " << part[i] << '\n';
    }
  }
  delete vtxdist;
  delete xadj;
  delete adjncy;
  delete tpwgts;

  // Finish Comm

  ierr = MPI_Finalize();

  return 0;
}
