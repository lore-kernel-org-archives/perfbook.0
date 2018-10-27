Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pg1-f174.google.com ([209.85.215.174]:44628 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbeJ0WIc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 Oct 2018 18:08:32 -0400
Received: by mail-pg1-f174.google.com with SMTP id w3-v6so1788814pgs.11
        for <perfbook@vger.kernel.org>; Sat, 27 Oct 2018 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xqQJDIBBBJAXrX/tQt5PWOHVazxVB0Hn37ikoM/Laz0=;
        b=ZH2SiLthls+1cBhD1xjpyqzadd/ZXpTi2KU2czOHtbKcjXPfIhvY71VY+qVCowyW1d
         /tXpnVNQaL6En8/wu651E2UAaSCtHr8XYbph4WJgPAtMtQrSrPWtFgMmLv1rcXlYQS6Q
         VL8OfVmfdPp24MZitYT6EUv6bthy0qiILInOUXqeU2YXrGhxKX6at+CXClGFjuHzzdxS
         vsdCAlTv6ySBD2+x0Mtq04sOguWPIE4t7BgctMeSDrHnSqP6WZLGFoFQkwD8UTkPMlZC
         dszCNyxBWT+2BLcmrcMPeZ20W+gr+yI9j5pO0P27tmIUy1TRbPs1/e7aMr6nkxPHP7sA
         ftIw==
Subject: Re: perfbook
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com> <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <96dcab56-15ff-0af2-0322-1b95b561c16b@gmail.com>
 <20181027125844.GA6083@andrea>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6f0b596f-82df-6778-4d2b-26010d135901@gmail.com>
Date: Sat, 27 Oct 2018 22:27:24 +0900
MIME-Version: 1.0
In-Reply-To: <20181027125844.GA6083@andrea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On 2018/10/27 21:58, Andrea Parri wrote:
>> Just want to make sure the gs version.
>>
>> "gs -v" on my Ubuntu 18.04 says:
>>
>> GPL Ghostscript 9.25 (2018-09-13)
>> Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
>>
>> What does your "gs -v" say?
> 
> It said:
> 
> GPL Ghostscript GIT PRERELEASE 9.25 (2018-03-21)
> Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
> 
> which suggested that my previous "from ubuntu 18.04" was in fact not
> matching reality: it looks like I installed gs from sources, only a
> few months ago, and completely forgot about it. ;/  Mah, 

Ah!

>                                                          I manually
> removed my binary (/usr/local/bin/gs), and apt-purged-and-installed
> fig2ps ghostscript ghostscript-x gv.
> 
> 
> Now it says:
> 
> GPL Ghostscript 9.25 (2018-09-13)
> Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
> 
> which seems to match what you reported above.  I was then able to
> generate perfbook.pdf, even though with a bunch of:
> 
> CodeSamples/SMPdesign/smpalloc.canonical.eps --> CodeSamples/SMPdesign/smpalloc.canonical.pdf
> GPL Ghostscript 9.25: Unrecoverable error, exit code 1
That's why the output of e2ping is redirected to /dev/null in the Makefile.

> 
> I only had a quick look at the generated .pdf, but I haven't noticed
> issues.  Are those errors expected?  Any other suggestion?

As I mentioned earlier, the error message from gs is
expected and can be safely ignored for perfbook.pdf generation.
Please restore Makefile by "git checkout -- Makefile".

Glad to know you can now build .pdf on your own.

And if you will ever do the first-time build again, you can do
parallel make by saying "make -j4" (4 is for a quad-core machine).

You can try it by "make neatfreak; make -j4" if you'd like to.

        Thanks, Akira

> 
> Thanks,
>   Andrea
> 
> 
>>
>>         Akira

