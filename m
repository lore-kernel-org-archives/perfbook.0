Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=laJ10+YS+Aju4Rv3uW8uKYoNWTJM4qsILQCKJH89NTk=;
 b=0m/406Hw6pvv7ReqK3CdqLBnxzUt/KamZLHyU6h3S6mCngef5uioYCjvQvOPK9U0PQ
 hpmuGrPO4yBLIVONzMNnZefy4bmH3pnr7OibGx4F8F3omggG8g75F8cH73mKmxEoqoZW
 vcMLyPF4cjpLpky7ymlif0hUc/kDx+dWsLTKsTDb1olVmr1jIbTUgengr9BfLO2jfubV
 6mHVhals8KSaBjmTXSmV3fYLtFHktmI4/QaggFDw+lEaL2ZOS1C4Us2ZwEMxugQvf71A
 R3LZP5SEYECZVLuSJ+KBwWgTOPQY5SrDrVabxfyU5JA7yav3C4qW5Yvbe6voYbW2/u0j
 nJYA==
Subject: Re: Suggestion on labels of "Pre-BSD Routing Table" scaling figures
References: <6a019120-d54f-dbe3-cfa5-1565ae27e7d3@gmail.com>
 <20160712163454.GT7094@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e8df404f-88db-113b-6c72-725bd2d5d2b6@gmail.com>
Date: Wed, 13 Jul 2016 23:37:35 +0900
MIME-Version: 1.0
In-Reply-To: <20160712163454.GT7094@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/13 1:34, Paul E. McKenney wrote:
> On Wed, Jul 13, 2016 at 12:32:01AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Thanks to your addition in Chapter 9, it is getting more and more
>> convincing.
>
> Glad you like them!  A little more to go...
>
>> However, the X-axis label in Figures 9.5, 9.9, and 9.16 is
>> "Number of CPUs/Threads."
>> At first glance, I read it as "Number of CPUs per Threads."
>> It took a few seconds for me to realize that it means
>> "Number of CPUs or Threads."
>>
>> In Figure 4.10, the x-axis label is "Number of CPUs (Threads)."
>> I think this is better to avoid ambiguity.
>>
>> What do you think?
>
> Sold!!!  ;-)
>
> Made this change with your Signed-off-by.

Hi,

So, I searched "CPUs/Threads" in the pdf and 10 other labels hit.
See the list below. (Sorry, but with page numbers of 2 column pdf.)

* p.38 Figure 5.3
* p.77 Figure 6.22
* p.78 Figure 6.23 and in the text just below
* p.166 Figures 10.7, 10.8, and 10.9
* p.168 Figures 10.13 and 10.14
* p.169 Figure 10.15
* p.177 Figure 10.29

These figures existed before your recent rewrite of Chapter 9,
and I never found them ambiguous. So I might have been on a
different planet last night or something...
If you think it is still better to modify them, please consider
doing so.

There is another "CPUs/Threads" in p.437 at the definition of
"Linearizable," but it is not at all ambiguous in the context.

                                                 Thanks, Akira

>
> 							Thanx, Paul
>
>

