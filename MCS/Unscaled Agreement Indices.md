Unscaled Agreement Indices
================================
- Summary agreement indices based on the absolute difference of readings by observers are
grouped here as unscaled agreement indices. 
- They are usually defined as the expectation
of a function of the difference, or features of the distribution of the absolute difference.
- These indices include mean squared deviation, repeatability coefficient, repeatability variance,
reproducibility variance (ISO), limits of agreement (Bland and Altman, 1999), coverage
probability (CP) and total deviation index (TDI) (Lin et al., 2002 Choudhary and Nagaraja,
2007; Choudhary, 2007a).


\section{Appendix 5 : Indices and Graphical Techniques}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

As an alternative to limits of agreement, \citet{lin2002} proposes the use of
the mean square deviation in assessing agreement. The mean square
deviation is defined as the expectation of the squared differences
of two readings. The MSD is usually used for the case of two
measurement methods $X$ and $Y$, each making one measurement for
the same subject, and is given by:
\[
MSDxy = E[(x - y)^2]  = (\mu_{x} - \mu_{y})^2 + (\sigma_{x} -
\sigma_{y})^2 + 2\sigma_{x}\sigma_{y}(1-\rho_{xy}).
\]


\citet{Barnhart} advises the use of a predetermined upper limit
for the MSD value, $MSD_{ul}$, to define satisfactory agreement.
However, a satisfactory upper limit may not be easily
determinable, thus creating a drawback to this technique.


Alternative indices, proposed by \citet{Barnhart}, are the square root of the MSD and the expected absolute difference (EAD). 
\[
EAD = E(|x - y|) = \frac{\sum |x_{i}- y_{i}|}{n},
\]
Both of these indices can be interpreted intuitively, since their units are the same as that of the original measurements. They can also be compared to the maximum acceptable absolute difference between two methods of measurement $d_{0}$. For the sake of brevity, the EAD will be considered solely.

The EAD can be used to supplement the inter-method bias in an
initial comparison study, as the EAD is informative as a measure
of dispersion, is easy to calculate and requires no distributional
assumptions. A consequence of using absolute differences is that high variances would result in a higher EAD value. 

% latex table generated in R 3.1.1 by xtable 1.7-4 package
% Mon Feb 23 21:12:33 2015
% latex table generated in R 3.1.1 by xtable 1.7-4 package
% Mon Feb 23 21:13:45 2015
% latex table generated in R 3.1.1 by xtable 1.7-4 package
% Mon Feb 23 22:10:26 2015
%\begin{table}[ht]
%	\centering
%	\begin{tabular}{r| rrrr}
%		\hline
%		\item & X & Y & U & V \\ 
%		\hline
%		1 & 101.83 & 102.52 & 98.05 & 99.53 \\ 
%		2 & 101.68 & 102.69 & 99.17 & 96.53 \\ 
%		3 & 97.89 & 99.01 & 100.31 & 97.55 \\ 
%		4 & 98.15 & 99.57 & 100.35 & 96.03 \\ 
%		5 & 99.94 & 100.85 & 99.51 & 99.00 \\ 
%		6 & 98.85 & 98.86 & 98.50 & 100.76 \\ 
%		7 & 99.86 & 97.85 & 100.66 & 99.37 \\ 
%		8 & 101.57 & 100.21 & 99.66 & 108.87 \\ 
%		9 & 100.12 & 99.85 & 99.70 & 105.16 \\ 
%		10 & 99.49 & 98.77 & 101.55 & 94.31 \\ 
%		\hline
%	\end{tabular}
%\end{table}




\begin{table}[ht]
	\centering
	\begin{tabular}{|c|c|c|c|c|}
		\hline
		& U & V & $U-V$ & $|U-V|$ \\ 
		\hline
		1 & 98.05 & 99.53 & -1.49 & 1.49 \\ 
		2 & 99.17 & 96.53 & 2.64 & 2.64 \\ 
		3 & 100.31 & 97.55 & 2.75 & 2.75 \\ 
		4 & 100.35 & 96.03 & 4.32 & 4.32 \\ 
		5 & 99.51 & 99.00 & 0.51 & 0.51 \\ 
		6 & 98.50 & 100.76 & -2.26 & 2.26 \\ 
		7 & 100.66 & 99.37 & 1.29 & 1.29 \\ 
		8 & 99.66 & 108.87 & -9.21 & 9.21 \\ 
		9 & 99.70 & 105.16 & -5.45 & 5.45 \\ 
		10 & 101.55 & 94.31 & 7.24 & 7.24 \\ 
		\hline
	\end{tabular}
	\caption{Example data set}
	\label{EADdata}
\end{table}

To illustrate the use of EAD, consider Table ~\ref{EADdata}. The inter-method bias of 0.03, which is desirably close to zero in the context of agreement. However, an identity plot would indicate very poor agreement, as the points are noticeably distant from the line of equality.
\begin{figure}
	\centering
	\includegraphics[width=0.5\linewidth]{EAD-UV}
	\caption{Identity Plot for example data}
	\label{fig:EADidentity}
\end{figure}

The limits of agreement are $[-9.61, 9.68]$, which is a wide interval for this data. As with the identity plot, this would indicate lack of agreement. As with inter-method bias, an EAD value close to zero is desirable. However, from Table ~\ref{EADdata}, the EAD can be computed as 3.71. The Bland-Altman plot remains a useful part of the analysis. In Figure \ref{fig:EAD1}, it is clear there is a systematic decrease in differences across the range of measurements.
\begin{figure}[h!]
	\centering
	\includegraphics[width=0.55\linewidth]{images/EAD1}
	\caption{Bland-Altman Plot for UV comparison}
	\label{fig:EAD1}
\end{figure}

\citet{Barnhart} remarks that a comparison of EAD and MSD, using
simulation studies, would be interesting, while further adding
that `\textit{It will be of interest to investigate the benefits of these
	possible new unscaled agreement indices}'. For the Grubbs' `F vs C' and `F vs T' comparisons, the inter-method bias, difference variances, limits of agreement and EADs are shown
in Table 1.5. The corresponding Bland-Altman plots for `F vs C' and `F vs T' comparisons were depicted previously on Figure 1.3. While the inter-method bias for the `F vs T' comparison is smaller, the EAD penalizes the comparison for having a greater variance of differences. The EAD values for both comparisons are therefore much closer.
\begin{table}[ht]
	\begin{center}
		\begin{tabular}{|c||c|c|}
			\hline
			& F vs C & F vs T  \\\hline
			\hline
			Inter-method bias & -0.61 & 0.12 \\ \hline
			Difference variance & 0.06 & 0.22  \\ \hline 
			Limits of agreement & (-1.08,	-0.13) & (-0.81,1.04) \\ \hline
			EAD & 0.61 & 0.35  \\ \hline 
		\end{tabular}
		\caption{Agreement indices for Grubbs' data comparisons.}
	\end{center}
\end{table}

Further to  \citet{lin2000} and \citet{lin2002}, individual agreement between two measurement methods may be
assessed using the the coverage probability (CP) criteria or the total deviation index (TDI). If $d_{0}$ is predetermined as the maximum acceptable absolute difference between two methods of measurement, the probability that the absolute difference of two measures being less than $d_{0}$ can be computed. This is known as the coverage probability (CP).
\begin{equation}
CP = P(|x_{i} - y_{i}| \leq d_{0})
\end{equation}

If $\pi_{0}$ is set as the predetermined coverage probability, the
boundary under which the proportion of absolute differences is
$\pi_{0}$ may be determined. This boundary is known as the `Total Deviation Index' (TDI). Hence the TDI is the $100\pi_{0}$
percentile of the absolute difference of paired observations.
%----------------------------------------------------------------------------%
