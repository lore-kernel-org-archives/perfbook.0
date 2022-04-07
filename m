Return-Path: <SRS0=e2sJ=UR=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZxgyA9cjXIX4YKmdSLG8DnFw+I6lrP2pM0OnDpxFbQQ=;
        b=nBt/qse6/gSz+CUOnmrwBfZvgEKlS1WybMJ5GCiHBjLgh2b13wbsDRv+6Dxg0Hu6SA
         KL9F5dDn1YEkhQzoK2mXOiTvzqLyFWiwtFV8W2iVo9mlsUWFxuIDmE3OxV2u+ST/J+tS
         Ue1RJkNXRcERAVzuXGT/sCXDtuP1f+R7sOlcCSzoUAQzXd8Lg6pItyowgYSxjj2k5IwW
         si4QO4O1xvK/8mfJyIDEQpUdzdQ+liBpdqn3HPdV9W/E6qVtf5w9YwrojTHKCFbyn+cE
         K0l8Yd500dtC4yBPiigLDL3qbI0i/ZGYKTTzSUUrxt7Rd5OE9cBwcqdxFEXe4jR5BJR1
         /kHw==
Message-ID: <6cf56caf-6355-0624-27d2-5420265d55e8@gmail.com>
Date: Fri, 8 Apr 2022 00:29:36 +0900
MIME-Version: 1.0
Subject: Re: Does perfbook need some prior knowledge?
Content-Language: en-US
References: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
 <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Hao Lee <haolee.swjtu@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Let me make a suggestion regarding Hao's poor experience as a first-time
reader of Section 4.3.

On Tue, 5 Apr 2022 08:31:20 -0700,
Paul E. McKenney wrote:
> On Tue, Apr 05, 2022 at 09:52:23PM +0800, Hao Lee wrote:
>> Hi, Paul
>>
>> I'm currently reading perfbook, but I often get stuck in some concepts
>> which are not explained. Does this book need some prior knowledge?
>> Or all these concepts are explained later and I just need to keep
>> reading patiently?
>>
>> For example, on page 67 in v2021.12.22a:
>>
>>     For example, a write memory barrier (Linux kernel smp_wmb()) would
>>     order the store, but not the load. This situation might suggest use
>>     of smp_store_release() over smp_wmb().

So this is in Section 4.3.4.1 "Shared-Variable Shenanigans".

I think one of the purpose of Chapter 4 is an introduction to various
constructs which are used/discussed in later chapters and CodeSamples.

If I were a first-time reader, I'd find Section 4.3.4 out-of-place
because other sections in this chapter explain APIs and their usages
in a brief manner.

My suggestion is to move hard parts of Section 4.3.4 to a later
chapter/appendix and to leave a brief introduction in Chapter 4 around
the discussion of READ_ONCE() and WRITE_ONCE().

And I believe you have intentionally avoided discussing memory ordering
and memory barriers in Chapter 4, as they are pretty "advanced" topic.

So a brief introduction to them in Chapter 4 would also be helpful.

I think "data race" and "battle with compiler optimizations" in
accessing shared memory from C are also "advanced" topics in that
they are not intuitive for those who is willing to learn parallel
programming.

Thoughts?

>>
>> Unfortunately, although I have some knowledge about Linux kernel, I'm not
>> familiar with the concepts such as store_release, smp_wmb, etc. I don't
>> know if I should keep reading this book until all these concepts are
>> explained or stop reading the book and learn some prior knowledge.> 
> Good point.  On the one hand, this book is rather advanced, but on the
> other hand, it needs to be as accessible as is reasonably possible.
> 

Expanding general Index and API Index might be helpful here.
At the moment, they are "work in progress".  Somehow, there is no entry
related to memory barriers in the general Index, and very limited memory
barrier primitives in API Index.  This may be due to the lack of
"memory barrier" and related terms in Glossary.

        Thanks, Akira

[...]
