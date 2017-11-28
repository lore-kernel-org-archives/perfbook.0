Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NuTc2GXsbv7H5iSEDcT5oigsKFhtYAleC8lt/TA3MZ4=;
 b=lL1K2P6YPrJMuK+5/ERDxp0KLSfIXkem81hKhCtSdGHlHvtSE7mwZ5NCJjvv+CfMfA
 hqaZ9DylGOY2Ormr/b3z8pRUBIAK+XJple8yRQJeM06lQkFXGuSYiUc1BWDkbidGGaFw
 YZPQAwM56Fo0cDYEW4YXmwiERql4EvwXiN+QiuBsQPk8SvYki8+oYLyitgnd7UPQoyOc
 +BO+ScIwPjX7MrG88BDU+JMEfdeUnUw9a5pMQt0LfrPRkFc64vzuZBkgjD7U8IxBaLuM
 RnYmz/EC+KkPN1XUgbT45t5ayH2xq1z0/F8Po3B3I4mXvS66ndqZpHUkbrj41V73GAkM
 8uEQ==
Subject: Re: [PATCH] CodeSamples/formal/herd: Remove dependency to memory
 model in cross-klitmus
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
 <436dc15a-073d-adec-3fd6-92633bd93041@gmail.com>
 <7350c9f9-6f73-3a00-eee6-239889f93d37@gmail.com>
 <20171126184024.GC3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f323d375-0088-c125-d149-fb6168756b35@gmail.com>
Date: Wed, 29 Nov 2017 00:24:32 +0900
MIME-Version: 1.0
In-Reply-To: <20171126184024.GC3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/26 10:40:24 -0800, Paul E. McKenney wrote:
> On Thu, Nov 23, 2017 at 12:17:57PM +0900, Akira Yokosawa wrote:
>> >From 62491d966a645d08ffc6bb0c5bae9f725458cbec Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Thu, 23 Nov 2017 12:07:18 +0900
>> Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to memory model in cross-klitmus
>>
>> Target "cross-klitmus" does not depend on memory model.
>> Remove the implicit dependency of "cd $(LKMM_DIR)" from the recipe.
>>
>> Fixes: ef76630632df ("CodeSamples/formal/herd: Add Makefile and utility script")
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I applied and pushed both, the first just before the release and the one
> below as the first commit after the release.
> 
> I also attached the (very crude) scripts that I use to collect herd
> performance data, just in case they are useful.

Well, I have no idea how to use absperf-reduce.sh.
It's partly because I'm not good at awk, but I can't figure out what kind of
input and arguments the script assumes.

Can you show me an example?

I know absperf.sh runs each litmus test 10 times with timeout of 15 minutes.

I'd be happy to integrate the collection feature into formal/herd/Makefile,
once I know what is expected.

      Thanks, Akira

> 
> 							Thanx, Paul
[...]

