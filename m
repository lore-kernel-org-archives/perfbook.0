Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62637 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1752742AbcHPCqw (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Mon, 15 Aug 2016 22:46:52 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7G2cbbc065638
 for <perfbook@vger.kernel.org>; Mon, 15 Aug 2016 22:46:52 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24tgpdwdgx-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 15 Aug 2016 22:46:51 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 15 Aug
 2016 20:46:51 -0600
Date: Mon, 15 Aug 2016 19:46:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] Makefile: Check availability of `a2ping` and
 `inkscape`
Reply-To: paulmck@linux.vnet.ibm.com
References: <1471310212-4354-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471310212-4354-1-git-send-email-sj38.park@gmail.com>
Message-Id: <20160816024655.GH3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 16, 2016 at 10:16:51AM +0900, SeongJae Park wrote:
> This commit modifies Makefile to check availability of `a2ping` and
> `inkscape` command as it already does for `dot` and `fig2eps`.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Applied both, thank you!

							Thanx, Paul

> ---
>  Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index b3d7c4c..60e8e96 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -41,6 +41,10 @@ DOT := $(shell which dot 2>/dev/null)
> 
>  FIG2EPS := $(shell which fig2eps 2>/dev/null)
> 
> +A2PING := $(shell which a2ping 2>/dev/null)
> +
> +INKSCAPE := $(shell which inkscape 2>/dev/null)
> +
>  default = $(PERFBOOK_DEFAULT)
> 
>  ifeq ($(default),)
> @@ -127,10 +131,16 @@ endif
> 
>  $(PDFTARGETS_OF_EPS): %.pdf: %.eps
>  	@echo "$< --> $@"
> +ifndef A2PING
> +	$(error "$< --> $@: a2ping not found. Please install it.")
> +endif
>  	@a2ping --below --hires --bboxfrom=compute-gs $< $@ > /dev/null 2>&1
> 
>  $(PDFTARGETS_OF_SVG): %.pdf: %.svg
>  	@echo "$< --> $@"
> +ifndef INKSCAPE
> +	$(error "$< --> $@: inkscape not found. Please install it.")
> +endif
>  	@inkscape --export-pdf=$@ $<
> 
>  clean:
> -- 
> 1.9.1
> 

