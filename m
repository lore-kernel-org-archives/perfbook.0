Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IGvyiAAAgWijoDONHu4Taw8qV2VOZsvpoDSS5uyMyJ4=;
        b=Gzv87kjgx1RDkU7Zwq11xHTFUjBBQsmhIHo2rFNM6BLEXchro3jjWFcUugah3jyFqL
         83AlUHRh9vYw3ZgRXN29SsONvm4FGc+6xpaCHEfpkzUPOykGxSfi1SKdomk2FUR80rZp
         lngjXk8tnGsgAJTPNXlaitGa397J1EQH+tsR589r6s/0yBa7KsCDOg1QCl8TVkGp8buB
         dE9IgwIgX2xcrc/Y1wLEF/fZg2YV8jJuzs2qbozO/MihOHL5/9Mnx06990Iczr3zxqCQ
         uaiFxvu4wAHlhDryPintTe7rKargAaf/AZp2VkwnFo/u36FdtCWbLJRBMipAF9Gkvl5y
         zuAw==
Subject: Re: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray
 litmus test
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
 <f824fa58-c67a-afb5-68e2-cac8cf86660e@gmail.com>
 <20190212161631.GL4240@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <074fb553-9044-ded1-ab15-66f73350e7fc@gmail.com>
Date: Wed, 13 Feb 2019 07:11:02 +0900
MIME-Version: 1.0
In-Reply-To: <20190212161631.GL4240@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2019/02/12 08:16:31 -0800, Paul E. McKenney wrote:
> On Wed, Feb 13, 2019 at 12:39:38AM +0900, Akira Yokosawa wrote:
>> >From 0ddf5c5ea4a66a0d6bff1b6c0ce32682459c20ad Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 12 Feb 2019 23:18:29 +0900
>> Subject: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray litmus test
>>
>> C-SB+o-rcusync-o+rl-rul-o.litmus is identical to
>> C-SB+o-rcusync-o+rl-o-rul-o.litmus and causes "make" to emit
>> warning:
>>
>>     target 'CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o@whole.fcv'
>>     given more than once in the same rule
>>
>> This commit removes "snippet" meta commands in the test.
>> Just removing the file can cause a build error afterward.
>> A "make clean" will resolve the error, but keeping the file
>> looks like a reasonable approach to avoid surprising people.
>> The file can be removed in the near future when most active
>> users have updated snippets.d.
> 
> Unless I am confused, this litmus test appears as Listing 15.37.

Listing 15.37 is "C-SB+o-rcusync-o+rl-o-rul-o".
The file I modified is "C-SB+o-rcusync-o+rl-rul-o.litmus" (note the
missing "-o-" in the final part") but contains the same test
"C-SB+o-rcusync-o+rl-o-rul-o". There exists
C-SB+o-rcusync-o+rl-o-rul-o.litmus which contains the same test
"C-SB+o-rcusync-o+rl-o-rul-o". So C-SB+o-rcusync-o+rl-rul-o.litmus
can be safely removed. But this patch removes the snippet meta-commands
instead.

Have I made the point clearer?

        Thanks, Akira

> That said, its discussion does not reference any line numbers, so
> the snippet comments could reasonably be removed.  Or maybe I should
> instead upgrade the discussion to include line numbers.
> 
> So what am I missing here?
> 
> 							Thanx, Paul
> 
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
>> index a39baf3..2407a51 100644
>> --- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
>> +++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
>> @@ -1,5 +1,4 @@
>>  C C-SB+o-rcusync-o+rl-o-rul-o
>> -//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\@\[\]]
>>  {
>>  }
>>  
>> @@ -19,5 +18,4 @@ P1(uintptr_t *x0, uintptr_t *x1)
>>  	uintptr_t r2 = READ_ONCE(*x0);
>>  }
>>  
>> -//\end[snippet]
>>  exists (1:r2=0 /\ 0:r2=0)
>> -- 
>> 2.7.4
>>
>>
> 

