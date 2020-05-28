Return-Path: <SRS0=gYOr=7K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UJgnnL0In/W0g1lO+tzVe29cBGVbDK6odjX4N8JbDos=;
        b=q6klcZsrGH9+LllLgvaH16q+dG+VvtYz4VmU/Q2Q5gvDLjRPMUyUb5oZpgvc3786q3
         Rpf2TfXw/87d1/dAu7IlzrtWnqj99WywAIVHUgtY4yxXSAtjbyBsbBLBRjThOZtVSthC
         Zq50YQWFyU1gtySHF2kn1FlL1da2gIXRVEbNdbn/Voie2PDosY/dtKnD8dmB4W8J7Mw/
         +TepgVK3vBH80WtEct4OmCLHRs1YrFqKUxWu+GwCnTZKRO4DPOzxfcd4+dyzs/8AxjO+
         yG6woRjnkV8Oxgwy4CHM0OsbJBJGoBusLbsD+Wqjf+LkbeZuJoefrRNcvngVlxKpLDiQ
         Zxeg==
Subject: Re: [PATCH 2/2] CodeSamples/formal/herd/absperf-reduce: Enforce
 compare as number
References: <7dea1e63-95bf-8d5b-dca2-47e741a5ed48@gmail.com>
 <8c68598d-847a-81c8-4612-66f957627601@gmail.com>
 <20200528005015.GC2869@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9d294bb4-ea3f-34d7-a8b6-0825e033b15f@gmail.com>
Date: Thu, 28 May 2020 10:05:06 +0900
MIME-Version: 1.0
In-Reply-To: <20200528005015.GC2869@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 27 May 2020 17:50:15 -0700, Paul E. McKenney wrote:
> On Thu, May 28, 2020 at 07:44:11AM +0900, Akira Yokosawa wrote:
>> >From 213bf072d15dfc3dce36b51a8bc1d35bd78e6609 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Thu, 28 May 2020 07:25:04 +0900
>> Subject: [PATCH 2/2] CodeSamples/formal/herd/absperf-reduce: Enforce compare as number
>>
>> When there are differences in the number of digits in runtime,
>> absperf-reduce.sh miscalculates min and max values and shows strange
>> results such as:
>>
>>     C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 13.255 11.81 9.64
>>                                            (avr)  (min) (max)
>>
>> Fix this by adding 0 on both sides of comparison and enforce conversion
>> to numbers.  After this change:
>>
>>     C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 13.255 9.23 15.77
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Applied and pushed both, thank you!
> 
> Did any of these runtime errors make their way into the tables in
> the text?

I don't think so.  Tables 17.4 and E.5 present averages only.

I spotted them while I did some absperf runs to compare herd7 7.52 and
herd7 HEAD during discussions with Andrii.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  CodeSamples/formal/herd/absperf-reduce.sh | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/CodeSamples/formal/herd/absperf-reduce.sh b/CodeSamples/formal/herd/absperf-reduce.sh
>> index 0c338b8b..9cf52182 100644
>> --- a/CodeSamples/formal/herd/absperf-reduce.sh
>> +++ b/CodeSamples/formal/herd/absperf-reduce.sh
>> @@ -16,9 +16,9 @@ awk '
>>  		gsub(/user .*$/, "", curtesttime);
>>  		testtime_n[curtest]++;
>>  		testtime_sum[curtest] += curtesttime;
>> -		if (testtime_max[curtest] == "" || curtesttime > testtime_max[curtest])
>> +		if (testtime_max[curtest] == "" || curtesttime + 0 > testtime_max[curtest] + 0)
>>  			testtime_max[curtest] = curtesttime;
>> -		if (testtime_min[curtest] == "" || curtesttime < testtime_min[curtest])
>> +		if (testtime_min[curtest] == "" || curtesttime + 0 < testtime_min[curtest] + 0)
>>  			testtime_min[curtest] = curtesttime;
>>  	}
>>  }
>> -- 
>> 2.17.1
>>
>>
