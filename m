Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B9ce0u0sFDOgY4tSoA9Zd4LFdzY1Yvv9R+X39AolkCs=;
 b=TDZ/mu0IUY0M+LHyNYU9+Jp9fKoZM7iXbps5aDxKGU+26swcCWSn4c3/mECHxeX3Gs
 Crsc9/03u424XAfmYlmZ6YmxC5YXBTnWX3+Tj6RU4IpOHDoIEnln4kMCfKW3XGBShQYO
 zcBEpqspLrn+rYbJMzTKjzMgS+sS2J+JbpgdFprEVuEN7KCaCnYasVUUV9ob+VCIgFes
 /Ht8kLTAILBxorv5FkR7z/oWGaMoiRy89QfXOMQSzS3VjyQv399ASbxqihaPXxZLsFcz
 /cIj6Mvs8EZH6Fazkx7WrtxV7JbuETfpyvpnUXXeYbCsJooe2R+V+2kw/Ll+P5TGJckv
 MsiQ==
Subject: Re: [PATCH 0/3] Tweak section-level epigraph
References: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
 <20180901172947.GN4225@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <616a5f71-a7f9-4846-c4ff-77da3fcb3dc6@gmail.com>
Date: Sun, 2 Sep 2018 08:26:42 +0900
MIME-Version: 1.0
In-Reply-To: <20180901172947.GN4225@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/09/01 10:29:47 -0700, Paul E. McKenney wrote:
> On Sat, Sep 01, 2018 at 09:11:36AM +0900, Akira Yokosawa wrote:
>> >From 40c5e61208be1df272b99fa103b9d74ddbb1c379 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sat, 1 Sep 2018 08:45:12 +0900
>> Subject: [PATCH 0/3] Tweak section-level epigraph
>>
>> Hi Paul,
>>
>> Recently, you added section-level epigraphs in debugging chapter.
>> I noticed minor issues in there appearances.
>>
>>   1. 1st paragraph of a section is now indented.
>>   2. In "1csf" target, section-level epigraph of sans serif font
>>      looks inconsistent with chapter-level epigraph of roman font.
>>
>> Indent right after an epigraph can be suppressed by using
>> "noindentafter" package. However, Ubuntu Trusty has a buggy one.
>> So patch #1 imports the latest one.
>> Patch #2 enables the \NoIndentAfterCmd setting for \epigraph{}.
>> Patch #3 removes font family setting in \Epigraph{} for chapter-
>> level epigraph.
>>
>> Note that Patch #1 contains trailing blanks.
> 
> Nice!!!
> 
> But given the license and this line from noindentafter.sty, don't
> we either have to also add noindentafter.tex on the one hand or
> say where to get them on the other?
> 
> "This work consists of the files noindentafter.tex and noindentafter.sty."
> 
> Or am I misinterpreting the license?
> 
You are right!
But the actual noindentafter 0.2.2 has more files necessary to
compile noindentafter.tex.
So, I'll add the info where to get the whole package.
A patch with a proper commit message is coming soon.

        Thanks, Akira
> 							Thanx, Paul
> 
>>          Thanks, Akira
>>
>> Akira Yokosawa (3):
>>   Import noindentafter.sty 0.2.2
>>   Suppress indent right after section-level epigraph
>>   Remove font family specifier in \Epigraph{}
>>
>>  Makefile          |   1 +
>>  noindentafter.sty | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  perfbook.tex      |   4 +-
>>  3 files changed, 193 insertions(+), 1 deletion(-)
>>  create mode 100644 noindentafter.sty
>>
>> -- 
>> 2.7.4
>>
> 

