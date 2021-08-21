Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230343AbhHUWhr (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 21 Aug 2021 18:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629585427;
        bh=An71CWzqewkTPI6B95aN8bF9zE6AQZb5IeFC8Z40Wqs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pmKfOSo9KXezxDjfLp7zNDje6kaT85YRdpSUzuuu+CqU21JMiUTgO1MfsE+yvSWeZ
         VjtSfiNOapHz6NCWdCa4c0KZTJVeHjMaP7dy3o1dZa/atsivoYARXMGTY7CGWOGq/w
         19B4+zCTwqu/55Tmzd0APoWfCMB0/lDQ4aSiyfuGWZQnkGj8pgK57tlf4CMOTfG5fZ
         GiOZTlr8J/ZtsHZ9vWpFoFk4KfOglcRYukluxbsinkQzp4MVHtSCCJhN2ev3rr+jJa
         Juo2FbWkWIlOyW4wBZzOGuORu5VLedVj2ZOfXSwq2maAdDXlwbhyFPnosG/ubYNDWz
         LVTOCS6ADGLBw==
Date: Sat, 21 Aug 2021 15:37:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] sytleguide: Upgrade references to NIST style
 guide as bibliography
Message-ID: <20210821223706.GO4126399@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <5de06cfa-b092-4a98-ae2b-056fd4404d8b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5de06cfa-b092-4a98-ae2b-056fd4404d8b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 21, 2021 at 11:07:16AM +0900, Akira Yokosawa wrote:
> The NIST style guide was referenced as URL links in footnotes.
> Those links got broken due to the update of SI standards in 2019.
> 
> Fix this by adding proper BiBTeX entries in standard.bib and citing them.
> Also make NIST's other cheat sheets and JEDEC's "mega as a prefix to units"
> dictionary page as bibliography entries.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I put the bib entries in standards.bib, which might or might not
> be the right place.
> If you have more suitable place in mind, please let me know.

Queued and pushed, thank you!  One could argue that I should have
created standards.bib some time ago.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
>  appendix/styleguide/styleguide.tex | 20 ++++++-------------
>  bib/standards.bib                  | 31 ++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 14 deletions(-)
> 
> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> index e980cb5c..d23207ac 100644
> --- a/appendix/styleguide/styleguide.tex
> +++ b/appendix/styleguide/styleguide.tex
> @@ -98,10 +98,8 @@ Following is a convention regarding punctuation in \LaTeX\ sources.
>  \subsubsection{SI Unit Symbol}
>  \label{sec:app:styleguide:SI Unit Symbol}
>  
> -NIST style guide\footnote{
> -  \url{https://www.nist.gov/pml/nist-guide-si-chapter-7-rules-and-style-conventions-expressing-values-quantities}}
> +NIST style guide~\cite[Chapter 5]{NIST:SP:330:2019}
>  states the following rules (rephrased for perfbook).
> -% cite: https://www.nist.gov/pml/nist-guide-si-chapter-7-rules-and-style-conventions-expressing-values-quantities
>  
>  \begin{itemize}
>  \item When SI unit symbols such as ``ns'', ``MHz'', and ``K'' (kelvin)
> @@ -156,8 +154,8 @@ Example:
>  Strictly speaking, NIST guide requires us to use the binary prefixes
>  ``Ki'', ``Mi'', or ``Gi'' to represent powers of~$2^{10}$.
>  However, we accept the JEDEC conventions to use ``K'', ``M'',
> -and ``G'' as binary prefixes in describing memory capacity.\footnote{
> -  \url{https://www.jedec.org/standards-documents/dictionary/terms/mega-m-prefix-units-semiconductor-storage-capacity}}
> +and ``G'' as binary prefixes in describing memory
> +capacity~\cite{JEDEC:dict:prefixmega}.
>  
>  An acceptable example:
>  \begin{quote}
> @@ -210,9 +208,7 @@ symbols.
>  \subsubsection{Font Style}
>  \label{sec:app:styleguide:Font Style}
>  
> -Quote from NIST check list:\footnote{
> -  \#6 in \url{https://physics.nist.gov/cuu/Units/checklist.html}
> -}
> +Quote from NIST check list~\cite[\#6]{NIST:UnitCheckList}:
>  
>  \begin{quote}
>    Variables and quantity symbols are in italic type.
> @@ -228,9 +224,7 @@ For example,
>  \end{quote}
>  
>  On the other hand, mathematical constants such as the base
> -of natural logarithms should be roman.\footnote{
> -  \url{https://physics.nist.gov/cuu/pdf/typefaces.pdf}
> -}
> +of natural logarithms should be roman~\cite{NIST:TypeFaces}.
>  For example,
>  
>  \begin{quote}
> @@ -250,9 +244,7 @@ Other English conventions are followed in such cases.
>  \subsubsection{Digit Grouping}
>  \label{sec:app:styleguide:Digit Grouping}
>  
> -Quote from NIST checklist:\footnote{
> -  \#16 in \url{https://physics.nist.gov/cuu/Units/checklist.html}.
> -}
> +Quote from NIST checklist~\cite[\#16]{NIST:UnitCheckList}:
>  
>  \begin{quote}
>    The digits of numerical values having more than four digits on either
> diff --git a/bib/standards.bib b/bib/standards.bib
> index 7edb988a..dc29ebc3 100644
> --- a/bib/standards.bib
> +++ b/bib/standards.bib
> @@ -47,3 +47,34 @@
>  \url{http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2443.pdf}
>  [Viewed January 26, 2020]",
>  }
> +
> +@techreport{NIST:SP:330:2019,
> +  author={{National Institure of Standards and Technology}},
> +  title={The International System of Units {(SI)}},
> +  institution={U.S. Department of Commerce},
> +  address={Washington, D.C.},
> +  number={NIST Special Publication 330 2019 EDITION},
> +  DOI={10.6028/NIST.SP.330-2019},
> +  year={2019},
> +}
> +
> +@webpage{JEDEC:dict:prefixmega,
> +  author={{JEDEC}},
> +  title={mega {(M)} (as a prefix to units of semiconductor storage capacity)},
> +  url={https://www.jedec.org/standards-documents/dictionary/terms/mega-m-prefix-units-semiconductor-storage-capacity},
> +  lastchecked={August 20, 2021},
> +}
> +
> +@webpage{NIST:UnitCheckList,
> +  author={{National Institure of Standards and Technology}},
> +  title={{SI Unit} rules and style conventions},
> +  url={https://physics.nist.gov/cuu/Units/checklist.html},
> +  lastchecked={August 20, 2021},
> +}
> +
> +@webpage{NIST:TypeFaces,
> +  author={{National Institure of Standards and Technology}},
> +  title={{Typefaces for Symbols in Scientific Manuscripts}},
> +  url={https://physics.nist.gov/cuu/pdf/typefaces.pdf},
> +  lastchecked={August 20, 2021},
> +}
> -- 
> 2.17.1
> 
