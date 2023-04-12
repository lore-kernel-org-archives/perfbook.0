Return-Path: <SRS0=ctHB=AD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681267890; x=1683859890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BaN2p4WqoDjK+Q0YNVo45vXwJktA9BtZMuDiXwFVGOY=;
        b=DmwjqCMyMX8fDC5gL9fQMdp5RnD1el9WlXlHfqFZ+E9L1mi8fBAWZgUHmSwQ0QES/j
         HVoGQqJ3zacjsLzBBpRyHWE5lrHc+zrm7Mx6XYUjd3u57CSj0rOsK5PO38jG8xfSWfb4
         UbUWVVCgz1kdi99rBpf6ztkr1Sgqguph3OD8jW/hdJfA7LTiNaXpv9V3TzfWuRUCtksB
         riiJFprWQy+Qgwqv4K5w4ZG4o32OQ36c9+fe5Hd5r6BWD5QpAEmgP0FKkidf5wTLl+qU
         qKdNly3DOkb35V/J+KAVQbVnXGJr5BolRUgI54LE6VqFXPiyx6sTpRS6n5bd83+wTzSz
         V/1Q==
Message-ID: <65116a6a-50c1-583b-0790-31b405c2c4dd@gmail.com>
Date: Wed, 12 Apr 2023 11:51:27 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] SMPDesign: Remove duplicate item
References: <20230411162805.1343469-1-mmpgouride@gmail.com>
 <ee5d3aff-58ef-85a4-ee0f-9ce8fbe7bfd8@gmail.com>
 <DAB6D77C-C34D-4F12-A589-63F42648E1C2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <DAB6D77C-C34D-4F12-A589-63F42648E1C2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 12 Apr 2023 09:15:12 +0800, Alan Huang wrote:
>>> -	Similarly, the greater the desired efficiency, the smaller
>>> +	Similarly, the greater the desired efficiency, the bigger
>>> 	the achievable speedup.
>>
>> I might not be fully woken up, but this change doesn't make
>> sense to me.
> 
> The original sentence means (to me) If we get greater efficiency use of CPUs,
> we get smaller speedup.
> 
> If I misunderstood, please correct me.

My version of interpretation of the sentence:

   Similarly, if our goal is greater efficiency, we might end up
   in a smaller speedup in the end.

One extreme approach for the greatest efficiency might be not to
parallelize at all, to use a single CPU, and to get a negative
speedup (i.e., speed down).

> 
>>    If the critical sections have high overhead compared to
>>    the primitives guarding them, the best way to improve
>>                                                  ^^^^^^^
>>    speedup is to increase parallelism by moving to reader/writer
>>    ^^^^^^^
>>    locking, data locking, asymmetric, or data ownership.
>>             ^^^^^^^^^^^^^                ^^^^^^^^^^^^^^
>>
>> Item 5:
>>
>>    If the critical sections have high overhead compared to
>>    the primitives guarding them and the data structure being
>>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>    guarded is read much more often than modified, the best way
>>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>    to increase parallelism is to move to reader/writer locking
>>    or asymmetric primitives.
>>
>> Are you sure they are duplicates ???
> 
> 
> If the critical sections have high overhead compared to the primitives guarding them,
> It means that the overhead of primitives is relative small, but the aim of data locking and data ownership 
> is to reduce the overhead of primitives.

Well, I think Paul's motivation of special casing read-mostly
data comes from his expertise in RCU.

I'd like to respect his motivation.

Anyway, this list is more of a guideline of approaches to
parallel-programming design considerations.
Why do you want it to be so precise ???

        Thanks, Akira

> 
> Thanks,
> Alan
> 
[...]
