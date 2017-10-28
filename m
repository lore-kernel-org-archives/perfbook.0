Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h88Md/oz958EhWMCtryuWILh6w43zSR7lIzS2Zw8hEc=;
 b=A7egEG1d7iyRsQwZ+rQ2p0m0tsZKSXgOf6AhHo8G0e9RpQ7qOsooiAEivnYUFwqXap
 ZS5XKDgtorE4A0kDDWeoQw3ct1iobNU1eTp2iyA4h05CRtm+Lr5xodKGPGgpYhzEYT8Q
 kGMHYWI96/g2FNTpdrQg9PfLTOp7XLjoIqi54An1zWu6WkfLnhmYQxqZZvpCHmXJKt8R
 SXBIzHYPMXq1R1cbTO/uNRO9vbcU5RF5i+Ue0nmE1unrtBycsOsnKBUXuzFw5yOq8Qux
 BdGUEjougrF7ZZXNDlw64vlXz0vGruYQVpuAEM3S5tNnqCyhxlXUoY7MR+dBWd47trN7
 mTcg==
Subject: Re: [PATCH] typo at Chp 7.
References: <20171027092317.GA8509@HP>
 <bf23f56f-b4e1-48fe-821d-721457cd469e@gmail.com>
 <20171027230549.GS3659@linux.vnet.ibm.com> <20171028080553.GA5742@HP>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7589cd7e-208c-6f8c-dd98-c587904c0b14@gmail.com>
Date: Sat, 28 Oct 2017 10:53:31 +0900
MIME-Version: 1.0
In-Reply-To: <20171028080553.GA5742@HP>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/28 17:06, Yubin Ruan wrote:
> On Fri, Oct 27, 2017 at 04:05:49PM -0700, Paul E. McKenney wrote:
>> On Sat, Oct 28, 2017 at 12:02:19AM +0900, Akira Yokosawa wrote:
>>> Hi Yubin,
>>>
>>> On 2017/10/27 18:23, Yubin Ruan wrote:
>>>> Hi paul,
>>>>
>>>> I finish chapter 7 and find some typo. Fixed in the patch below.
>>>>
>>>> Yubin
>>>>
>>>> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
>>>> index 9fcbbf9..c7c4ae8 100644
>>>> --- a/locking/locking-existence.tex
>>>> +++ b/locking/locking-existence.tex
>>>> @@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
>>>>  figure, it can be problematic if a given data element can be a member
>>>>  of multiple hash tables or given more-complex data structures such
>>>>  as trees or graphs.
>>>> -These problems can be solved, in fact, such solutions form the basis
>>>> +These problems can be solved. In fact, such solutions form the basis
>>>
>>> I'd suggest the following:
>>>
>>> +These problems can be solved, in fact, and such solutions form the basis
>>
>> How about this?
>>
>> 	Not only can these problems be solved, but the solutions also
>> 	form the basis of lock-based software transactional memory [...].
> 
> Thanks for your suggestion. I think Akira's approach looks more nature to me.
> So, let me finish this little patch ;-)

Well, I think Paul's suggestion is much clearer.

BTW Yubin, your mail has a date field indicating it came from the near future:

> Date: Sat, 28 Oct 2017 16:06:40 +0800

May be time zone setting issue?

      Thanks, Akira

> 
> Yubin
> 
> --------------------------------------------------------------------------
>>From aede1ef2fe8c5213c8aec9581192c5915e69010c Mon Sep 17 00:00:00 2001
> From: Yubin Ruan <ablacktshirt@gmail.com>
> Date: Sat, 28 Oct 2017 16:00:43 +0800
> Subject: [PATCH] locking: a typo fixed
> 
> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
> ---
>  locking/locking-existence.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> index 9fcbbf9..2be69d8 100644
> --- a/locking/locking-existence.tex
> +++ b/locking/locking-existence.tex
> @@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
>  figure, it can be problematic if a given data element can be a member
>  of multiple hash tables or given more-complex data structures such
>  as trees or graphs.
> -These problems can be solved, in fact, such solutions form the basis
> +These problems can be solved, in fact, and such solutions form the basis
>  of lock-based software transactional memory
>  implementations~\cite{Shavit95,DaveDice2006DISC}.
>  However,
> 

