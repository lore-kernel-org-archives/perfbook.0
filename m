Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=3QY0RR79IHzpGu9jIj2yt8+oqFuYwuLyrwk954qejMA=;
 b=LwYnHf4hXB8Hx+DjUHRwIEt5S7QrfBpshnhQRfg5UdZQKMiXFsGPLsjkkCgaiQscJr
 OHeR9ZmLj8ESZmHR6cx8nyflIRrcNuOTAL9EkbfZ+/fni9fPJpGdZ4iN1vKx6rRUUHPz
 qgZhPpF8Rjjels0dJrUvPeUhuzmoRVz29l3aaAbyWZl4zT5k6ho8MR/YM06TxLCWQzUT
 dPjhBVlS1hNsS/HrJRGMGZSRJmLPrTdomt/tvQuH9jhMmD0EBiGXcagm9SrNCK5Dfxnw
 7rMQ4+pzNl0QdElptI6fhTf7qkEk/3gEPMVRimFw6CKfbsQ6Y8TDdzkI2NtmoQyP8qBq
 Ih3g==
Subject: Re: [PATCH 0/3] Patches for recent updates
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
 <20161223185842.GB3742@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c7b39cad-90b4-140b-1e62-8d4ddc84f8ff@gmail.com>
Date: Sat, 24 Dec 2016 08:56:27 +0900
MIME-Version: 1.0
In-Reply-To: <20161223185842.GB3742@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/12/23 10:58:42 -0800, Paul E. McKenney wrote:
> On Fri, Dec 23, 2016 at 05:07:17PM +0900, Akira Yokosawa wrote:
>> >From cbb7797d6b307850a280248589bc09b8852e8a68 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Fri, 23 Dec 2016 16:46:06 +0900
>> Subject: [PATCH 0/3] Patches for recent updates
>>
>> Hi Paul,
>>
>> This short patch set consists of fixes to recent updates in
>> advsync/memorybarriers.
>>
>> I'm not sure what is your preference of quotation of short variable
>> names and keywords. In the 1st patch, I chose the form of ~~\co{a}''.
>> If you prefer other one, please let me know.
>>
>> Ya, I know a variety of styles are mixed-used in perfbook,
>> reflecting various original publications...
> 
> My current rule is that an identifier can be mistaken for an English
> word or letter of the alphabet, then it should be in double quotation
> marks and under \co{}, consistent with your changes.  However, something
> like "rcu_node" cannot reasonably be mistaken for English, so it only
> needs \co{}.
> 
> Thoughts?

So, the cause of potential confusion here is the use of variable name "a",
isn't it? If "a" were not there, other variable names b, c, q, x, and y would
not need quotation marks, I suppose.
"if", "then", and "else" still need quotation.

Hmm?

> 
>> But at least within a (sub)section, it would be better to keep
>> consistency.
> 
> Applied and pushed, thank you!
> 
> 							Thanx, Paul
> 
>>                                                 Thanks, Akira
>> -- 
>> Akira Yokosawa (3):
>>   advsync/memorybarriers: Use consistent quotation marks
>>   advsync/memorybarriers: Fix typo (READ_ONCE -> WRITE_ONCE)
>>   advsync/memorybarriers: Fix trivial typo
>>
>>  advsync/memorybarriers.tex | 30 +++++++++++++++---------------
>>  1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 
> 

