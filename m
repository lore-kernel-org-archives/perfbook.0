Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56371 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1753442AbcLKRMN (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 11 Dec 2016 12:12:13 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBBH8kld098215
 for <perfbook@vger.kernel.org>; Sun, 11 Dec 2016 12:12:12 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 278ytd1buq-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 11 Dec 2016 12:12:12 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 11 Dec
 2016 10:12:11 -0700
Date: Sun, 11 Dec 2016 09:12:19 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Abort build if 'mpost' is present in sources
Reply-To: paulmck@linux.vnet.ibm.com
References: <e9e56741-64b8-4030-55a0-c68a0df6676f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9e56741-64b8-4030-55a0-c68a0df6676f@gmail.com>
Message-Id: <20161211171219.GG3924@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Dec 12, 2016 at 12:31:36AM +0900, Akira Yokosawa wrote:
> >From 35304561657c417ed2820664fa424feedc461fc2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 10 Dec 2016 15:38:34 +0900
> Subject: [PATCH] Abort build if 'mpost' is present in sources
> 
> A POC of an arbitrary command execution vulnerability in TeX config
> was disclosed on November 28, 2016.
> 
> To avoid the exploitation, this commit adds checks just before latex
> invocations in runfirstlatex.sh, runlatex.sh, and the ".tex -> .eps"
> rule of Makefile.
> 
> The added script "mpostcheck.sh" first checks if your config is
> secure. If it is not, then it aborts the build if a word "mpost" is
> found in the sources. (It is not present at the moment.)
> 
> If "mpost" is not found, the build will continue. But mpostcheck.sh
> displays a warning message. To make sure the message can catch eyes,
> the script is also invoked at the end of runlatex.sh.
> 
> Once you fix your TeX config, the behavior of the build scripts
> will be the same as before.
> 
> Refer to the comment in mpostcheck.sh for the circumstances and
> instructions for fixing your TeX config.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Yow!!!

Queued and pushed, thank you Akira!

							Thanx, Paul

> ---
>  Makefile                   |   1 +
>  utilities/mpostcheck.sh    | 149 +++++++++++++++++++++++++++++++++++++++++++++
>  utilities/runfirstlatex.sh |   5 ++
>  utilities/runlatex.sh      |   5 ++
>  4 files changed, 160 insertions(+)
>  create mode 100644 utilities/mpostcheck.sh
> 
> diff --git a/Makefile b/Makefile
> index efd4e1b..e125678 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -122,6 +122,7 @@ perfbook-1csf.tex: perfbook-1c.tex
> 
>  $(EPSSOURCES_FROM_TEX): %.eps: %.tex
>  	@echo "$< --> $@"
> +	sh utilities/mpostcheck.sh
>  	@latex -output-directory=$(shell dirname $<) $< > /dev/null 2>&1
>  	@dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@ > /dev/null 2>&1
>  	@sh utilities/fixanepsfonts.sh $@
> diff --git a/utilities/mpostcheck.sh b/utilities/mpostcheck.sh
> new file mode 100644
> index 0000000..0e54923
> --- /dev/null
> +++ b/utilities/mpostcheck.sh
> @@ -0,0 +1,149 @@
> +#!/bin/sh
> +# Check the presence of "mpost" in LaTeX sources
> +#
> +# A POC of an arbitrary code execution vulnerability in the default
> +# configuration of TeX packages was disclosed at
> +# https://scumjr.github.io/2016/11/28/pwning-coworkers-thanks-to-latex/.
> +# TeX Live 2016 is updated on November 30, 2016 to plug the security hole
> +# by removing "mpost" from the "shell_escape_commands" variable of default
> +# texmf configuration.
> +# However, depending on the customization of a user, he/she can still be
> +# affected after the update.
> +#
> +# To prevent exploitation of the vulnerability, this script checks
> +# if "mpost" is present in source files of perfbook.
> +# If the vulnerability is fixed in your TeX environment, the check is
> +# skipped.
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
> +# Copyright (C) Akira Yokosawa, 2016
> +#
> +# Authors: Akira Yokosawa <akiyks@gmail.com>
> +#
> +#-------------------------------------------------------------------
> +# Instruction to plug the security hole
> +# (based on http://d.hatena.ne.jp/zrbabbler/20161206/1481039449 (in Japanese),
> +# translated and supplemented by Akira Yokosawa)
> +#
> +# 1. Test the config of your TeX environment
> +#
> +# Enter the following in a command shell:
> +#
> +#   $ kpsewhich -var-value=shell_escape_commands
> +#
> +# Example output:
> +#
> +#   bibtex,bibtex8,extractbb,kpsewhich,makeindex,mpost,repstopdf
> +#
> +# If "mpost" appears in the output, your setting is vulnerable.
> +# Following variants of "mpost" are also vulnerable:
> +#    pmpost
> +#    jmpost
> +#    upmpost
> +#
> +# Note:
> +#   "rmpost" and "rpmpost" in the list are known to be safe.
> +#
> +# 2. Solution
> +#
> +# 2-1. Update TeX distribution if possible
> +#
> +#   However, depending on your customization, you may still be vulnerable.
> +#   Do Step 1 again after the update.
> +#   If you are still vulnerable, proceed to Step 2-2.
> +#
> +# 2-2. Modify texmf configuration
> +#
> +# 2-2-1. Using tlmgr
> +#
> +#   If tlmgr is available, enter the following command in a command shell:
> +#
> +#   $ tlmgr conf texmf shell_escape_commands [list]
> +#
> +#   Here, [list] is a command list displayed in Step 1 with "mpost," removed,
> +#   e.g.:
> +#
> +#   $ tlmgr conf texmf shell_escape_commands \
> +#   > bibtex,bibtex8,extractbb,kpsewhich,makeindex,repstopdf
> +#
> +# 2-2-2. Manual fix
> +#
> +#  If tlmgr is not available, proceed as follows:
> +#
> +#  o Search effective texmf.cnf
> +#
> +#   Enter the following command:
> +#
> +#   $ kpsewhich texmf.cnf
> +#
> +#   The path displayed is the effective one.
> +#
> +#  o Edit the texmf.cnf to remove "mpost" from shell_escape_commands
> +#
> +#   If there is a line beginning with "shell_escape_commands=" in the
> +#   texmf.cnf file, edit it to remove "mpost,".
> +#
> +#   If there is not such a line, add a line of:
> +#
> +#   shell_escape_commands=[list]
> +#
> +#   where [list] is again a command list displayed in Step 1 with "mpost,"
> +#   removed, e.g.:
> +#
> +#   shell_escape_commands=bibtex,bibtex8,extractbb,kpsewhich,makeindex,repstopdf
> +#
> +# Note:
> +#   If the effective texmf.cnf has a comment saying not to edit it directly,
> +#   follow the instruction given there.
> +#-------------------------------------------------------------------
> +
> +dogrep() {
> +	texsrc=`find . -name "*.tex" -print`
> +	bibsrc=`find . -name "*.bib" -print`
> +	stysrc=`find . -name "*.sty" -print`
> +	clssrc=`find . -name "*.cls" -print`
> +	bstsrc=`find . -name "*.bst" -print`
> +	perfbooksrc="$texsrc $bibsrc $stysrc $clssrc $bstsrc"
> +	if grep -w -n "mpost" $perfbooksrc || \
> +			grep -w -n "[jp]mpost" $perfbooksrc || \
> +			grep -w -n "upmpost" $perfbooksrc
> +	then
> +		echo "#####################################################"
> +		echo "## 'mpost' is found in LaTeX sources. Aborting...  ##"
> +		echo "## Refer to comment in utilities/mpostcheck.sh.    ##"
> +		echo "#####################################################"
> +		exit 1
> +	fi
> +}
> +
> +if which kpsewhich >/dev/null
> +then
> +	command_list=`kpsewhich -var-value=shell_escape_commands`
> +	if echo $command_list | grep -w -q "mpost" || \
> +			echo $command_list | grep -w -q "[jp]mpost" || \
> +			echo $command_list | grep -w -q "upmpost"
> +	then
> +		echo "kpsewhich -var-value=shell_escape_commands"
> +		echo $command_list
> +		echo "WARNING: Refer to utilities/mpostcheck.sh for texmf config fix."
> +		dogrep
> +	else
> +		exit 0
> +	fi
> +else
> +	dogrep
> +	exit 0
> +fi
> diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
> index ac2edb2..5060725 100644
> --- a/utilities/runfirstlatex.sh
> +++ b/utilities/runfirstlatex.sh
> @@ -32,6 +32,11 @@ then
>  	exit 1
>  fi
> 
> +if ! sh utilities/mpostcheck.sh
> +then
> +	exit 1
> +fi
> +
>  basename=`echo $1 | sed -e 's/\.tex$//'`
> 
>  echo "pdflatex 1 for $basename.pdf"
> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
> index dca728c..a577a0c 100644
> --- a/utilities/runlatex.sh
> +++ b/utilities/runlatex.sh
> @@ -38,6 +38,10 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
> 
>  if ! test -r $basename-first.log
>  then
> +	if ! sh utilities/mpostcheck.sh
> +	then
> +		exit 1
> +	fi
>  	echo "pdflatex 1 for $basename.pdf"
>  	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
>  	if grep -q '! Emergency stop.' $basename.log
> @@ -129,4 +133,5 @@ then
>  	echo "## See item 1 in FAQ.txt and FAQ-BUILD.txt to fix the font issue.    ##"
>  	echo "#######################################################################"
>  fi
> +sh utilities/mpostcheck.sh
>  exit 0
> -- 
> 2.7.4
> 
> 

