Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e31.co.us.ibm.com ([32.97.110.149]:57188 "EHLO
 e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751920AbcEUPBz (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 21 May 2016
 11:01:55 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 21 May
 2016 09:01:54 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 E58893E4003B	for <perfbook@vger.kernel.org>; Sat, 21 May 2016 09:01:47 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4LF1l9L39911550	for <perfbook@vger.kernel.org>; Sat, 21 May 2016 15:01:47
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4LF1lLU002416	for <perfbook@vger.kernel.org>; Sat, 21 May 2016 11:01:47
 -0400
Date: Sat, 21 May 2016 08:01:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL v2] Fix false positive font warning and update related
 documents
Message-ID: <20160521150155.GD3528@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <f3ad99e8-8d6f-5910-9aad-35a35bfb3ea6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3ad99e8-8d6f-5910-9aad-35a35bfb3ea6@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, May 21, 2016 at 09:13:08AM +0900, Akira Yokosawa wrote:
> The following changes since commit adc5a0ed9702d1fa2ec8620b1ff16ed2fbd6b9a4:
> 
>   Fix typo "baloon" -> "balloon" (2016-05-18 18:30:31 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git fix-false-positive-v4
> 
> for you to fetch changes up to bd11b0d690485e0110d9ab31562a790f39d9abe6:
> 
>   Improve messages regarding font installation (2016-05-21 09:09:41 +0900)

Pulled, thank you!  This does eliminate the false positive.

							Thanx, Paul

> ----------------------------------------------------------------
> Akira Yokosawa (2):
>       Fix false positives in font check
>       Improve messages regarding font installation
> 
>  FAQ-BUILD.txt         | 6 +++---
>  howto/howto.tex       | 9 +++++----
>  utilities/eps2pdf.sh  | 4 ++--
>  utilities/runlatex.sh | 4 ++--
>  4 files changed, 12 insertions(+), 11 deletions(-)
> 

