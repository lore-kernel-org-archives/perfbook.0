Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:38852 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751008AbcDWFnd (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 23 Apr 2016
 01:43:33 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 23 Apr
 2016 01:43:32 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id F0ED26E803C
 for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 01:43:14 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3N5hTlW40173746	for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 05:43:29
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3N5hTTk018713	for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 01:43:29
 -0400
Date: Fri, 22 Apr 2016 22:44:02 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] runlatex.sh: Fix while loop condition
Message-ID: <20160423054402.GO3756@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <5718E390.1090309@gmail.com> <5718E478.3000406@gmail.com>
 <20160421162741.GB3879@linux.vnet.ibm.com> <57194E98.1040001@gmail.com>
 <20160421235400.GI3879@linux.vnet.ibm.com> <571A1FF0.2080602@gmail.com>
 <20160422133424.GP3879@linux.vnet.ibm.com> <571ADA6C.8030904@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571ADA6C.8030904@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 23, 2016 at 11:14:04AM +0900, Akira Yokosawa wrote:
> Hi, Paul.
> 
> I'm tempted to move the bibtex part out from runlatex.sh into Makefile.
> If I make targets for .bbl files in Makefile, then the .bbl files won't be
> necessary in the repository any more.
> 
> I'm wondering why those .bbl files are in the repository in the first place.
> Was there any reason I can't think of?
> 
> Yes, I know controlling latex with Makefile is sometimes tricky because of
> its side effects, but I think I can manage.
> 
> Just want to confirm the circumstances.

History.  That and laziness.  ;-)

Originally, the bib/*.bib files were not present, so the .bbl file
was absolutely necessary for anyone but me to build the book.  I
eventually got the bib/*.bib files to where they could be placed
in the archive, but never bothered updating things to get the .bbl
files out of git control.

Please do feel free to try updating the build as you suggest.

							Thanx, Paul

