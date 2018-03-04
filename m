Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TpESb0g0f6BoFtfY82QqKE006P8gxiE+kevaLgPHbxQ=;
 b=s8q4wl0VYPtF4JOvPFJxkuaF671jptvrZ+HmnDMd8nW64TyRu3dIlANa+5Q+CJfX4V
 F+pp0V9SSjZys5E5vldJ9nIPaajYm3gUIfaIoazCOulXYIsOvJMIhpF5zwjBYL6LAEtV
 aboblQpi5kcoS9WRTs/dJrktDpzgYcl96AN/+y9r28vzaoshZb7Plh1pD5dV82XkDP2A
 RjcTCAgeyyMDTzQiTtMq6BI9unVh//NmDtKST7/pNI9Guktblro/hIV4UM+VBRnUqZE4
 nW6mEvbfjii7Z4zWTFRXKqO0q/oBj9D0YR8+P1MMw/gFhctCuaUc8awkum8kkXpVT2B9
 C/mA==
Subject: Re: smp_read_barrier_depends() into READ_ONCE()
References: <20180304021305.GA4449@HP>
 <da538fa2-dd74-88ab-e302-429de922145c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <145d7558-f970-5740-a831-89db9edee764@gmail.com>
Date: Sun, 4 Mar 2018 12:43:07 +0900
MIME-Version: 1.0
In-Reply-To: <da538fa2-dd74-88ab-e302-429de922145c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/03/04 12:11:14 +0900, Akira Yokosawa wrote:
> On 2018/03/04 10:13:05 +0800, Yubin Ruan wrote:
>> Hi paul,
>>
>> Please provide the commit link/hash for the changes of
>> smp_read_barrier_depends() in the kernel. I remember that it was post by Akira
>> once on the mailing list, but not sure I can get the right one.
>>
>> Thanks,
>> Yubin
>>
> 
> Hi Yubin,
> 
> It's 76ebbe78f739 ("locking/barriers: Add implicit smp_read_barrier_depends() to
> READ_ONCE()").

FWIW, it was cherry-picked into x86-pti branch as commit c2bc66082e10, which was
also merged in merge-commit f8940a0f20eb ("Merge branch 'WIP.x86-pti.base-for-linus'
of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip").

        Thanks, Akira

> 
>         Thanks, Akira
> 

