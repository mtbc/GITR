#ifndef _INTERPRATECOEFF2D_
#define _INTERPRATECOEFF2D_

#ifdef __CUDACC__
#define CUDA_CALLABLE_MEMBER __host__ __device__
#define CUDA_CALLABLE_MEMBER_DEVICE __device__
#else
#define CUDA_CALLABLE_MEMBER
#define CUDA_CALLABLE_MEMBER_DEVICE
#endif

#include <thrust/device_vector.h>
#include <vector>
#include <cmath>
using namespace std;

#if USE_DOUBLE
typedef double gitr_precision;
#else
typedef float gitr_precision;
#endif

CUDA_CALLABLE_MEMBER


gitr_precision rateCoeffInterp(int charge, gitr_precision te, gitr_precision ne,int nT, int nD, gitr_precision* rateGrid_Tempp,gitr_precision* rateGrid_Densp,gitr_precision* Ratesp){

/*    std::vector<gitr_precision>& rateGrid_Temp = *rateGrid_Tempp;
    std::vector<gitr_precision>& rateGrid_Dens = *rateGrid_Densp;
    std::vector<gitr_precision>& Rates = *Ratesp;
  */  
    int indT = 0;
    int indN = 0;
    gitr_precision logT = std::log10(te);
    gitr_precision logn = std::log10(ne);
    //std::cout << "Rategrid_temp in rateCoeffInterp " << rateGrid_Temp[1] << std::endl;
    gitr_precision d_T = rateGrid_Tempp[1] - rateGrid_Tempp[0];
    gitr_precision d_n = rateGrid_Densp[1] - rateGrid_Densp[0];
   // if (logT >= rateGrid_Tempp[0] && logT <= rateGrid_Tempp[nT-2])
   // {
        indT = std::floor((logT - rateGrid_Tempp[0])/d_T );//addition of 0.5 finds nearest gridpoint
    //}
    //if (logn >= rateGrid_Densp[0] && logn <= rateGrid_Densp[nD-2])
    //{
        indN = std::floor((logn - rateGrid_Densp[0])/d_n );
    //}
    //std::cout << "Indices density, temp " << indN << " " <<indT<<std::endl;
    //std::cout << "charge " << charge << std::endl;
    //std::cout << "Lower value " << Ratesp[charge*nT*nD + indT*nD + indN] << std::endl;
if(indT < 0 || indT > nT-2)
{indT = 0;}
if(indN < 0 || indN > nD-2)
{indN = 0;}
if(charge > 74-1)
{charge = 0;}
        gitr_precision aT = std::pow(10.0f,rateGrid_Tempp[indT+1]) - te;
    gitr_precision bT = te - std::pow(10.0f,rateGrid_Tempp[indT]);
    gitr_precision abT = aT+bT;

    gitr_precision aN = std::pow(10.0f,rateGrid_Densp[indN+1]) - ne;
    gitr_precision bN = ne - std::pow(10.0f, rateGrid_Densp[indN]);
    gitr_precision abN = aN + bN;

    //gitr_precision interp_value = Rates[charge*rateGrid_Temp.size()*rateGrid_Dens.size()            + indT*rateGrid_Dens.size() + indN];

    gitr_precision fx_z1 = (aN*std::pow(10.0f,Ratesp[charge*nT*nD + indT*nD + indN]) 
            + bN*std::pow(10.0f,Ratesp[charge*nT*nD            + indT*nD + indN + 1]))/abN;
    
    gitr_precision fx_z2 = (aN*std::pow(10.0f,Ratesp[charge*nT*nD            + (indT+1)*nD + indN]) 
            + bN*std::pow(10.0f,Ratesp[charge*nT*nD            + (indT+1)*nD + indN+1]))/abN;
    gitr_precision fxz = (aT*fx_z1+bT*fx_z2)/abT;
    //std::cout << "fxz1 and 2 " << fx_z1 << " " << fx_z2<< " "<< fxz << std::endl;
    //printf ("gitr_precisions:%i %e  \n",charge,fxz);
    return fxz;    
}

CUDA_CALLABLE_MEMBER
gitr_precision interpRateCoeff2d ( int charge, gitr_precision x, gitr_precision y, gitr_precision z,int nx, int nz, gitr_precision* tempGridxp,
       gitr_precision* tempGridzp, gitr_precision* Tempp,
       gitr_precision* densGridxp,gitr_precision* densGridzp,gitr_precision* Densp,int nT_Rates, int nD_Rates,
       gitr_precision* rateGrid_Temp,gitr_precision* rateGrid_Dens,gitr_precision* Rates ) {
//    std::cout << "rate test " << Tempp[0] << std::endl;
    /*std::vector<gitr_precision>& Tdata = *Tempp;
    std::vector<gitr_precision>& Tgridx = *tempGridxp;
    std::vector<gitr_precision>& Tgridz = *tempGridzp;
    std::vector<gitr_precision>& DensityData = *Densp;
    std::vector<gitr_precision>& DensGridx = *densGridxp;
    std::vector<gitr_precision>& DensGridz = *densGridzp;
*/
    //std::cout << "at tlocal interp routine " <<x << y << z<< " " << nx << nz<< std::endl;
    //std::cout << "Interpolating local temp at "<<x << " " << y << " " << z << std::endl;
    gitr_precision tlocal = interp2dCombined(x,y,z,nx,nz,tempGridxp,tempGridzp,Tempp);
    //std::cout << "Interpolating local dens " << std::endl;
    gitr_precision nlocal = interp2dCombined(x,y,z,nx,nz,densGridxp,densGridzp,Densp);
    //std::cout << "tlocal" << tlocal << std::endl;
    //std::cout << "nlocal" << nlocal << std::endl;
    //std::cout << "Interpolating RC " << std::endl;
    gitr_precision RClocal = rateCoeffInterp(charge,tlocal,nlocal,nT_Rates,nD_Rates,rateGrid_Temp, rateGrid_Dens, Rates);
    gitr_precision tion = 1/(RClocal*nlocal);
    if(tlocal == 0.0 || nlocal == 0.0) tion=1.0e12;
    //std::cout << "Returning " << std::endl;
    return tion;
}

#endif

