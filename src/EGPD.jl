module EGPD

using CSV, Distributions, Extremes, Optim
using Gadfly
using TimeSeries
import Distributions: cdf, insupport, logcdf, logpdf, params, partype, pdf, quantile, sampler
import Extremes: qqplot, probplot, histplot, returnlevelplot, diagnosticplots
import Random: AbstractRNG
import Base: maximum, minimum, rand

include("parameterestimation.jl")
include("plots.jl")
include("utils.jl")

# distributions
include("distributions/naveau2016_type1.jl");
include("distributions/naveau2016_type1_nonstat.jl");
include("distributions/naveau2016_type2.jl");
include("distributions/naveau2016_type3.jl");
include("distributions/naveau2016_type4.jl");
include("distributions/EGPnormal.jl");
include("distributions/kallache2011.jl");

# bias correction
include("biascorrect.jl");
include("valid_indices.jl")

export
    # distribution types
    EGPpower,
    EGPpowermix,
    EGPbeta,
    EGPbetapower,
    EGPnormal,

    # methods
    cdf,         # cumulative distribution function
    insupport,   # predicate, is x in the support of the distribution?
    logpdf,      # log probability density
    logcdf,      # cdf returning log-probability
    maximum,
    minimum,
    params,      # get the tuple of parameters
    partype,
    pdf,         # probability density function
    quantile,    # inverse of cdf (defined for p in (0,1))
    rand,
    sampler,      # create a Sampler object for efficient samples


    # distribution fitting
    EGPpowerfit,
    EGPpowermixfit,
    EGPbetafit,
    EGPbetapowerfit,
    EGPnormalfit,

    # validation
    BIC,
    qqbuild,
    qqplot,
    ppbuild,
    probplot,
    histplot,
    returnlevelplot,
    diagnosticplots,
    Guide,

    # bias correction
    T_transform,
    bias_correct,
    CDFT,

    # validation indices
    index_skew,
    index_Rx,
    index_R10,
    index_pXwet,
    index_p98wet,
    index_pXwetamount,
    index_p98wetamount,
    index_RVxmax,
    index_RV20max,
    index_SDII,
    index_p90wet

end # module
