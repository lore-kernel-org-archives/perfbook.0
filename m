Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44633 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1759894AbdACRA4 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 3 Jan 2017 12:00:56 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id v03Gwtev032000
 for <perfbook@vger.kernel.org>; Tue, 3 Jan 2017 12:00:55 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 27rc49ubpc-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 03 Jan 2017 12:00:55 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 3 Jan 2017
 10:00:54 -0700
Date: Tue, 3 Jan 2017 09:00:51 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Make date of git commit be reflected automatically
Reply-To: paulmck@linux.vnet.ibm.com
References: <0d84ad72-8dad-8bb1-c74d-d14b01349406@gmail.com>
 <20170103032057.GP3742@linux.vnet.ibm.com>
 <78091077-d802-dac5-2de7-0d9496ed0875@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78091077-d802-dac5-2de7-0d9496ed0875@gmail.com>
Message-Id: <20170103170051.GR3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 04, 2017 at 12:10:45AM +0900, Akira Yokosawa wrote:
> >From dabed21140eee0a755c69aa1f63283fc7f7528d7 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 3 Jan 2017 23:50:16 +0900
> Subject: [PATCH] Make date of git commit be reflected automatically
> 
> This commit adds a script to extract git commit date info to
> generate autodate.tex.
> If invoked on a not-clean git repository, "(m)" is appended to date
> field of title.
> If git status is not availalbe, current date is used instead.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> While we are at it, I made a script to automatically reflect git commit date
> to title and copyright notice.
> 
> As you've locally updated legal.tex, this patch will have conflict,
> but it should be easy for you to resolve.
> 
> I chose commit date rather than author date because what matters is when a
> particular patch is committed in your tree.
> 
> Thoughts?

Very nice!  I have queued and pushed it.

							Thanx, Paul

>                                                      Thanks, Akira
> 
>  .gitignore            |  1 +
>  Makefile              |  7 +++++--
>  legal.tex             |  2 +-
>  perfbook.tex          |  1 +
>  utilities/autodate.sh | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 56 insertions(+), 3 deletions(-)
>  create mode 100644 utilities/autodate.sh
> 
> diff --git a/.gitignore b/.gitignore
> index 965b94d..3f2e4a9 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -20,6 +20,7 @@ contrib.tex
>  origpub.tex
>  perfbook*.out
>  perfbook-*.tex
> +autodate.tex
>  extraction
>  embedfonts
> 
> diff --git a/Makefile b/Makefile
> index f446a66..151fba7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -7,7 +7,7 @@ LATEXSOURCES = \
>  	*/*.tex \
>  	*/*/*.tex
> 
> -LATEXGENERATED = qqz.tex contrib.tex origpub.tex
> +LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
> 
>  ABBREVTARGETS := 1c hb mss mstx msr msn msnt 1csf
> 
> @@ -71,9 +71,12 @@ $(PDFTARGETS): %.pdf: %.tex %.bbl
>  $(PDFTARGETS:.pdf=.bbl): %.bbl: %.aux $(BIBSOURCES)
>  	bibtex $(basename $@)
> 
> -$(PDFTARGETS:.pdf=.aux): $(LATEXSOURCES) $(LATEXGENERATED)
> +$(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES)
>  	sh utilities/runfirstlatex.sh $(basename $@)
> 
> +autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES)
> +	sh utilities/autodate.sh >autodate.tex
> +
>  perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG)
>  	echo > qqz.tex
>  	echo > contrib.tex
> diff --git a/legal.tex b/legal.tex
> index e5cf1c8..965c76e 100644
> --- a/legal.tex
> +++ b/legal.tex
> @@ -42,6 +42,6 @@ for the exact licenses.
>  If you are unsure of the license for a given code fragment,
>  you should assume GPLv2-only.
> 
> -Combined work {\textcopyright}~2005-2016 by Paul E. McKenney.
> +Combined work {\textcopyright}~2005-\commityear\ by Paul E. McKenney.
> 
>  \IfTwoColumn{\twocolumn}{}
> diff --git a/perfbook.tex b/perfbook.tex
> index 4e6a173..ea063dc 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -105,6 +105,7 @@
>  	\href{mailto:paulmck@linux.vnet.ibm.com}{paulmck@linux.vnet.ibm.com} \\
>  } % end author
>  % \date{\ }
> +\input{autodate}
> 
>  \setcounter{topnumber}{3}
>  \renewcommand\topfraction{.75}
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> new file mode 100644
> index 0000000..6df8f99
> --- /dev/null
> +++ b/utilities/autodate.sh
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +#
> +# Extract git commit date info to generate autodate.tex.
> +# If invoked on not-clean git repository, append "(m)" to date field
> +# for title.
> +# If git status is not availabe, use current date instead.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, you can access it online at
> +# http://www.gnu.org/licenses/gpl-2.0.html.
> +#
> +# Copyright (C) Akira Yokosawa, 2017
> +#
> +# Authors: Akira Yokosawa <akiyks@gmail.com>
> +
> +export LC_TIME=C
> +# check if we are in git repository
> +if ! test -e .git
> +then
> +	date_str=`date -R`
> +	modified=""
> +else
> +	date_str=`git show --format="%cD" | head -1`
> +	# check if git status is clean
> +	gitstatus=`git status --porcelain | wc -l`
> +	if [ $gitstatus != "0" ]
> +	then
> +		modified=" (m)"
> +	else
> +		modified=""
> +	fi
> +fi
> +month=`date --date="$date_str" +%B`
> +year=`date --date="$date_str" +%Y`
> +day=`date --date="$date_str" +%e`
> +
> +echo "\\date{$month $day, $year$modified}"
> +echo "\\\newcommand{\\\commityear}{$year}"
> -- 
> 2.7.4
> 
> 

