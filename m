Return-Path: <SRS0=gvYa=AQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682393967; x=1684985967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhOF7Zg937z1dYDAdXb8q7NVU4YPMk1iDmqCUspq/ZU=;
        b=BOuKaHM+umNvtOLFZvjfSxpbp1DxVC2MbkAvLsG+4BbgixuEvS7wNgyrHLngJp2+0b
         COeEymR6ZUgVWjyWjoe4MKkF8bXxfkzNEnVHlRkgFaWhCvILyZv8Bl/y1eO+fpsmLHcT
         M2eRm2NgAsrd/pGxZEKENzk5KyY0J4gDFRo/1nkgU7L8+CBgY+yY13EW1oIeyt2Wbaj9
         dQ6wihXUIbpJBiqcf/WjNUC1v70/NN8VuCQzt89WalvimNO5uN8H4kZvXZwGXiK6KWs3
         GzBHhrfe/sIGDYRuBa9T/kp09PrH29/kfFAeeRSv63TSLHOxshHK8h9KSKOSnVDygmvI
         tH1g==
Message-ID: <5004be60-5ae9-981d-2eb7-15dc44f6cc08@gmail.com>
Date: Tue, 25 Apr 2023 12:39:24 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] CodeSamples/defer: Make hazard partition consistent with
 hazptr_thread_exit
Content-Language: en-US
References: <20230420074030.35246-1-mmpgouride@gmail.com>
 <7ea775ac-579c-4b73-8d07-b717f962bd50@paulmck-laptop>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <7ea775ac-579c-4b73-8d07-b717f962bd50@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org, Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 24 Apr 2023 09:02:57 -0700, Paul E. McKenney wrote:
> On Thu, Apr 20, 2023 at 07:40:30AM +0000, Alan Huang wrote:
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>>  CodeSamples/defer/hazptrtorture.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
>> index 29761e3d..acdd532b 100644
>> --- a/CodeSamples/defer/hazptrtorture.h
>> +++ b/CodeSamples/defer/hazptrtorture.h
>> @@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
>>  {
>>  	int i;
>>  	int me = (long)arg;
>> -	int base = me * K;
>> +	int base = smp_thread_id() * K;
> 
> Suppose specify a number of threads greater than the number of CPUs.
> For example, on my 12-hardware-thread laptop:
> 
> ./route_hazptr --stresstest --nreaders 24
> 
> In that case, don't we want "me" rather than "smp_thread_id()"?

But route_hazptr.c includes routetorture.h
Furthermore, route_hazptr.c doesn't call hp_record() which just
got fixed.

So it looks to me that Alan's fixes won't have any effect on
route_hazptr ...

But I might be missing something here.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>  	long long n_reads_local = 0;
>>  	hazptr_head_t hh;
>>  	hazptr_head_t *hhp = &hh;
>> -- 
>> 2.34.1
>>
