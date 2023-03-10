Return-Path: <SRS0=Yx13=7C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678489811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/OF6U0u71D90B+ak3c4rx2z+4dHI3isN5KQcFw/A6c=;
        b=I7s/6rwddLb/odgja6mkty5pCRPdBFHXREuolVA4oeBWTPbdaj9rOLgYnarBg1JogX
         5sCx31VY7vaY/PibryVCYk0w6KV1/NnCfvKZSYEjvaPW6Z8x+5RqccOFmFBNDuawRucC
         MpxweCbEi1sPAwV7hVtLrGAOE19WvywRPpav1i9Sse7ZKuAjQAG3ewIFo/H7QC/wwEFa
         PD8FJ0lPXvNQXtco2kTTIA1/WHsIowykGDR1UD1VxagBBOlbXCg78ZH9dMrI2BWTphY/
         PPV2xzTeynH4UJ+558oSE8rhu/hJhCT+lFcM+eMfl1SagJQ4AyqKjNeIPwEJCCJgFKKO
         Of1Q==
Message-ID: <05efa3a2-488b-f5ab-1862-56c7c14950e9@gmail.com>
Date: Sat, 11 Mar 2023 08:10:07 +0900
MIME-Version: 1.0
Subject: Re: [GIT PULL -perfbook] Improve portability of build scripts
References: <21e1a397-c9aa-2100-527c-e29191a918c2@gmail.com>
 <20fd9bd4-2081-4ee7-87da-5a827997dfbf@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20fd9bd4-2081-4ee7-87da-5a827997dfbf@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 10 Mar 2023 07:39:39 -0800, Paul E. McKenney wrote:
> On Fri, Mar 10, 2023 at 11:06:56PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> As I mentioned a month ago or so, I've been working on improving
>> portability of building perfbook.
>>
>> By portability, I did actual tests mostly under FreeBSD and light weight
>> alpine container images, not under macOS.
>> So I don't know if this enables native build for macOS, but here we are.
>>
>> I don't expect any regression for existing build environments.
>> (Famous last words!)
>>
>>         Thanks, Akira
>> --
> 
> Seems to work, so I queued and pushed it.
> 
> On a separate topic, Ubuntu 22.04 seems to require "apt install fuse"
> in addition to the list currently shown, but that might be an artifact
> of my installation.  Without this, inkscape refuses to create PDFs.
> (I am somewhat surprised that inkscape would require this.)

I think you are using an Appimage release of Inkscape.

This issue is covered here:

    https://docs.appimage.org/user-guide/troubleshooting/fuse.html#setting-up-fuse-2-x-alongside-of-fuse-3-x-on-recent-ubuntu-22-04-debian-and-their-derivatives

        Thanks, Akira

> 
> 							Thanx, Paul
> 

