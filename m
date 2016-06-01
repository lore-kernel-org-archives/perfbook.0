Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=NYOPoMF5Eu5FQGHoqpuLS3T3wSwqKSVhAirSyF4QcfQ=;
 b=TcWvIMG+qIUhhmNoJwXinzMuM0Zk24+WOk57tyoMG4BgxQqlM9Uv0zl5rQW1eiazTX
 Dw3Q3ejmhgAPgaYEJZNciNGuvbhDUkBOzz5OIl5xmwdGk3w0Fw6ZGzbd8VcA8rjqWDla
 KjUpFrI1HFAbTD8AQdp9pEh0ci+GFJX5A8WiD+ingp2GNGRB73gu9k4tgje/W0Dz06C1
 xSqAaK15uftMH1mDSrxF+Y3bAbjQDye0LVEYmZg6sowi3abjOWnoI7cd2HyEIAJbtsBD
 MhDokWZZSv+6xU38uHvNv8BN6+cG7lFdbhhWUybavPbtulcLCFA5OQageIxs51CTwRiZ
 wTig==
Subject: Re: [Question] Redundant .fig and .svg files
References: <89eb7320-04cb-af7d-1cec-38260bd7bfe0@gmail.com>
 <20160528174905.GH4337@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bf46b1cb-3920-dfc3-3b45-6d1ceb65867a@gmail.com>
Date: Wed, 1 Jun 2016 23:48:29 +0900
MIME-Version: 1.0
In-Reply-To: <20160528174905.GH4337@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/28 10:49:05 -0700, Paul E. McKenney wrote:
> On Sat, May 28, 2016 at 09:14:57AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I'm doing another round of build script cleanup.
>> In the cleanup, I found redundant .fig and .svg files listed below.
>>
>>     SMPdesign/lockdeq.fig SMPdesign/lockdeq.svg
>
> This one is used on line 191 of SMPdesign/partexercises.tex.
>
>>     cartoons/patterns.fig cartoons/patterns.svg
>
> Ah, this one's purpose is to allow .fig-style patterns to be cut and
> pasted into .svg files.

I see. But I want them to be ignored by wildcards in Makefile.
Would it be acceptable if I make a directory such as 'cartoons/.unused'
and move those files there?

Also, I found that 'appendix/rcuimpl/RCUpreemptCounters.fig'
and 'appendix/rcuimple/RCUpreemptCounters.eps' are in the repository
but are not used in any .tex sources. Would it be OK to do the same
for them?

>
>> It seems the .fig files are not used any more.
>> Do you mind if I remove them from the repository?
>
> Feel free to remove SMPdesign/lockdeq.fig, but please leave the others.
>
> That said, if you know of a way to get decent shading patterns out of
> inkscape, then the two cartoons/patterns files could be dispensed with.
>

Well, I'm afraid I can't help you here.

BTW, I'd like to explain my intention of this round of cleanup.

My goal this time is to make it possible to use -jN option of 'make'
in building just after cloning the repository (or after doing
'make neatfreak').

To achieve this, those rules written in scripts under the 'utilities'
directory need to be promoted into Makefile. In doing so, I want to use
wildcards in Makefile. 

In trying this approach, I noticed there are a few figures that are not
used anywhere. So I asked the first question of this thread.

Are you interested in this kind of build script restructuring?
Or am I trying too much?

                                                      Thanks, Akira 

> 							Thanx, Paul
>
>

