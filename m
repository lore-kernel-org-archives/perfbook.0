Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44548 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730027AbeIXXlX (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 24 Sep 2018 19:41:23 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w8OHY6k2128698
        for <perfbook@vger.kernel.org>; Mon, 24 Sep 2018 13:38:07 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mq3jstjq8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 24 Sep 2018 13:38:07 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 24 Sep 2018 13:38:06 -0400
Date: Mon, 24 Sep 2018 10:37:59 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] Require updating a2ping to 2.83p on older distos
Reply-To: paulmck@linux.ibm.com
References: <aec4b5bb-0095-bfc5-e4b3-2fbd97c5311a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aec4b5bb-0095-bfc5-e4b3-2fbd97c5311a@gmail.com>
Message-Id: <20180924173759.GM4222@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 24, 2018 at 12:02:08PM +0900, Akira Yokosawa wrote:
> >From f44b769bdf6da275a09ae3abe0decc835ba65875 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 24 Sep 2018 11:26:02 +0900
> Subject: [PATCH] Require updating a2ping to 2.83p on older distos
> 
> Recent security fixes to Ghostscript [1] on Ubuntu Trusty and
> Xenial broke a2ping 2.77p.
> 
> This change removes conditional of "Ghostscript 9.22 and later" in
> checking a2ping's version, and report error if 2.77p is found.
> Also update FAQ-BUILD.txt to provide nicer instructions to update.
> 
> [1]: https://usn.ubuntu.com/3768-1/
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Great catch, thank you!!!  Applied and pushed.

							Thanx, Paul

> ---
>  FAQ-BUILD.txt | 21 ++++++++++++++-------
>  Makefile      |  6 ++----
>  2 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index 9fb3b68..336ab71 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -53,8 +53,9 @@
>  			texlive-science texlive-fonts-extra
>  			xfig inkscape graphviz fig2ps
>  
> -		You might need to fetch a version of a2ping which is
> -		compatible with Ghostscript 9.22. See #7 below.
> +		You need to fetch a version of a2ping which is
> +		compatible with updated Ghostscript (not limited to
> +		Ubuntu Bionic). See #7 below.
>  
>  		On Fedora 28 and 27, installing the following set of
>  		packages suffices:
> @@ -86,14 +87,20 @@
>  
>  	A.	Please see #5 above.
>  
> -7.	Building perfbook aborts with error "a2ping version conflict".
> +7.	Building perfbook aborts with error "Your need to update a2ping".
>  	What can I do?
>  
> -	A.	Updating a2ping can resolve the build error if you
> -		have Ghostscript 9.22 or later.  Compatible a2ping
> -		(2.83p) is available at:
> +	A.	a2ping 2.77p has become incompatible with up-to-date
> +		Ghostscript on most Linux distributions since September
> +		2018 due to security fixes backported from Ghostscript
> +		9.22 and later. A compatible a2ping (2.83p) is available
> +		at:
>  			https://www.ctan.org/pkg/a2ping
> -		It is included in TeX Live 2018 or later.
> +
> +		Copy "a2ping.pl" as "a2ping" into a directory which
> +		precedes /usr/bin in your PATH setting.
> +
> +		a2ping 2.83p is included in TeX Live 2018 or later.
>  
>  8.	When I try to build perfbook, it hangs after printing a line
>  	reading "pdflatex 1".  How can I fix this?
> diff --git a/Makefile b/Makefile
> index 72865d7..4810812 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -75,9 +75,7 @@ STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
>  ifdef A2PING
>  A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
>  ifeq ($(A2PING_277P),1)
> -GS_VER := $(shell gs --version)
> -A2PING_GSCNFL := $(shell env printf "%05.2f\n%05.2f\n" $(GS_VER) 9.22 | \
> -	sort | head -1 | grep -c "09.22")
> +A2PING_GSCNFL := 1
>  else
>  A2PING_GSCNFL := 0
>  endif
> @@ -216,7 +214,7 @@ ifndef A2PING
>  	$(error $< --> $@: a2ping not found. Please install it)
>  endif
>  ifeq ($(A2PING_GSCNFL),1)
> -	$(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
> +	$(error You need to update a2ping. See #7 in FAQ-BUILD.txt)
>  endif
>  	@cp $< $<i
>  	@sh $(FIXANEPSFONTS) $<i
> -- 
> 2.7.4
> 

