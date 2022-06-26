Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbiFZDDz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 25 Jun 2022 23:03:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDFA13CF5
        for <perfbook@vger.kernel.org>; Sat, 25 Jun 2022 20:03:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B266FB80B76
        for <perfbook@vger.kernel.org>; Sun, 26 Jun 2022 03:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656212631;
        bh=/uEfQMK+8Nhr85AQo6uB5nxstlOZkT9ldiOR/C0jObo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=FM8ppcpQ97uvrOscGbbPCChpaPe+IAVJHDCdw6TFWWCW6vBK76OvYKiofBS57+m+D
         xSAESNjqFlLIQOQBCv6m5u0Vz1jwHQzEsccOheVbH+/JPXexmZ+D0wDXUqdat/zeZg
         W4qS2VvzzrFpLhZ4/OllfGHa8Uz73fouAZl/7sSUxdcfY+crV3ehjOJ2ycyqGz+7PB
         AcqMca/BVNOo3wJPo3J/cr27QXaenUT1XpP9d8kvS0M189ar9jQ8FVdo08kEgVK2h8
         C3//TgBIJavMBBMJH8HS12CR7YPUHB0N5H6VSgFm4y+6H6Rt/4EttZIJ5j5yBhaRmK
         4upDdO61e0bOQ==
Date: Sat, 25 Jun 2022 20:03:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Is parallel programing hard...
Message-ID: <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
List-ID: <perfbook.vger.kernel.org>
To: "Snir, Marc" <snir@illinois.edu>
Cc: perfbook@vger.kernel.org

[ Adding the perfbook email list on CC. ]

On Sun, Jun 26, 2022 at 02:00:40AM +0000, Snir, Marc wrote:
> Hi:
> I got a fatal latex error trying to create the pdf on my own. I append
> below the last lines of the log and the full log. Latex seems to fail
> soon after \maketitle

This is a new one on me!

One workaround is to us int Dockerfile template under the docker/
subdirectory.  This is described in question 13 in FAQ-BUILD.txt
in the top-level directory.

What environment are you running in?  There are quirks for a few
of them.

> I send this FYI, in case it might help you; I loaded the pdf file,
> and this works for me.

Glad the PDF file worked!

Which reminds me, it is past time for me to do another release.

> Thanks for putting all this material on the web.

Glad you like it, and I hope that it proves helpful!

							Thanx, Paul

> Marc
> 
> 
> 
> 
> 
> (/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
> File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
> )
> LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
> (Font)              scaled to size 12.0pt on input line 605.
> LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
> (Font)              scaled to size 8.8pt on input line 605.
> LaTeX Font Info:    Font shape `TS1/ntxtlf/m/n' will be
> (Font)              scaled to size 6.6pt on input line 605.
> 
> 
> ! LaTeX Error: There's no line here to end.
> 
> 
> See the LaTeX manual or LaTeX Companion for explanation.
> Type  H <return>  for immediate help.
>  ...
> 
> l.605 \IfTwoColumn
>                   {
> ?
> ! Emergency stop.
>  ...
> 
> l.605 \IfTwoColumn
>                   {
> Your command was ignored.
> Type  I <command> <return>  to replace it with another command,
> or  <return>  to continue without it.
> 
> 
> 
> 
> 


