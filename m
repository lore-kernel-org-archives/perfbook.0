Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=iug4poSFLJXOIUetcp0+6/8zAJ8rVk3cdZR6UyTJNtg=;
 b=Nd8eUa0mLPaQw5WzuCk2vihRSIAsyaWHbeYPLJ4TqV//OLoTGIlguso9xyiBV2CfsM
 X5bxm+LMyPseRWm1wURragWnymWDnzUHuHHSFeIYt9JzfKPRCxuBJevok0SlKiNu5UfC
 LKl+7Hg+o+x/IYd8/XT12K2V7XBjt+Yev+oIIe22ObRJRsMsFhAXknEcEiVydZxNweG+
 eobuaK4wnYqJWuVTLEFTzfIjrdEhoJDZj2bAyfx5Iu19VVUVtRj0n39BNiH650HPnVqC
 yzHTGFrqVaVYTRrqPzEeETNlHfp7TApfRCGyFbCa+4Dt6dMdfRLyLwh3Wf7hCudTqB2q
 GC1Q==
Subject: Re: [PATCH 2/2] runlatex.sh: Fix while loop condition
References: <5718E390.1090309@gmail.com> <5718E478.3000406@gmail.com>
 <20160421162741.GB3879@linux.vnet.ibm.com> <57194E98.1040001@gmail.com>
 <20160421235400.GI3879@linux.vnet.ibm.com> <571A1FF0.2080602@gmail.com>
 <20160422133424.GP3879@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571ADA6C.8030904@gmail.com>
Date: Sat, 23 Apr 2016 11:14:04 +0900
MIME-Version: 1.0
In-Reply-To: <20160422133424.GP3879@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul.

I'm tempted to move the bibtex part out from runlatex.sh into Makefile.
If I make targets for .bbl files in Makefile, then the .bbl files won't be
necessary in the repository any more.

I'm wondering why those .bbl files are in the repository in the first place.
Was there any reason I can't think of?

Yes, I know controlling latex with Makefile is sometimes tricky because of
its side effects, but I think I can manage.

Just want to confirm the circumstances.

                                                        Thanks, Akira

