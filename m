Return-Path: <SRS0=EyQm=7O=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EQCAvn+PboruXL7bNIsuAiz8SCtC69Y4Dkzm/QGZPVY=;
        b=EVnbp4Eb+x+K0sEr1zxZoIbDnnNJsTlW3B27/v0JuN03cUNGti7PGoFUAQ+8z+6o8X
         hQav46+N9hLuwafbd+GXYU3GdBqRmVANiqS+2wCHzUi456eZ0XdWeTeVT/rpDbugGQqx
         2sSFpyJhdcofqC7kIW2chBE/1i2OEpu/4Xc8JC4JOSw7MF+AKH0XI4m5ScoMvNZFl+bZ
         +V8QJaQkNmt0KswU0w7XWBSAFIxagH7cHDc9CX+Xt61FpDJxWS3rH+M25JIex+TcvyH8
         PR1/ABCRuNoxUJlwkpJEIVwkL8cKPBI64bcX8x0M8zMvtYdkodGE0/IEFKeQBtQL8l7h
         8Tlw==
Subject: Re: [PATCH 0/3] defer: misc updates
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
 <20200531165023.GL2869@paulmck-ThinkPad-P72>
 <fedc50c6-1f06-f223-25df-4001d6457120@gmail.com>
 <20200601011838.GP2869@paulmck-ThinkPad-P72>
 <8ddda3fd-b95f-4558-6d7c-d205d9704575@gmail.com>
 <20200601161349.GB29598@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7fed7967-19e2-5d26-9848-4e998586c88c@gmail.com>
Date: Tue, 2 Jun 2020 07:51:31 +0900
MIME-Version: 1.0
In-Reply-To: <20200601161349.GB29598@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 1 Jun 2020 09:13:49 -0700, Paul E. McKenney wrote:
> On Tue, Jun 02, 2020 at 12:10:06AM +0900, Akira Yokosawa wrote:
>> On Sun, 31 May 2020 18:18:38 -0700, Paul E. McKenney wrote:
>>> On Mon, Jun 01, 2020 at 08:11:06AM +0900, Akira Yokosawa wrote:
>>>> On Sun, 31 May 2020 09:50:23 -0700, Paul E. McKenney wrote:
>>>>> On Sun, May 31, 2020 at 09:30:44AM +0900, Akira Yokosawa wrote:
>>>>>> Hi Paul,
>>>>>>
>>>>>> This is misc updates in response to your recent updates.
>>>>>>
>>>>>> Patch 1/3 treats QQZ annotations for "nq" build.
>>>>>
>>>>> Good reminder, thank you!
>>>>>
>>>>>> Patch 2/3 adds a paragraph in #9 of FAQ.txt.  The wording may need
>>>>>> your retouch for fluency.
>>>>>> Patch 3/3 is an independent improvement of runlatex.sh.  It will avoid
>>>>>> a few redundant runs of pdflatex when you have some typo in labels/refs.
>>>>>
>>>>> Nice, queued and pushed, thank you!
>>>>>
>>>>>> Another suggestion to Figures 9.25 and 9.29.
>>>>>> Wouldn't these graphs look better with log scale x-axis?
>>>>>>
>>>>>> X range can be 0.001 -- 10.
>>>>>>
>>>>>> You'll need to add a few data points in sub-microsecond critical-section
>>>>>> duration to show plausible shapes in those regions, though.
>>>>>
>>>>> I took a quick look and didn't find any nanosecond delay primitives
>>>>> in the Linux kernel, but yes, that would be nicer looking.
>>>>>
>>>>> I don't expect to make further progress on this particular graph
>>>>> in the immediate future, but if you know of such a delay primitive,
>>>>> please don't keep it a secret!  ;-)
>>>>
>>>> I find ndelay() defined in include/asm_generic/delay.h.
>>>> I'm not sure if it works as you would expect, though.
>>>
>>> I must be going blind, given that I missed that one!
>>
>> :-) :-)
>>
>>> I did try it out, and it suffers from about 10% timing errors.  In
>>> contrast, udelay is usually less than 1%.
>>
>> You mean udelay(1)'s error is less than 10ns, whereas ndelay(1000)'s
>> error is about 100ns?
> 
> Yuck.  The 10% was a preliminary eyeballing.  An overnight run showed it
> to be worst than that.  100ns gets me about 130ns, 200ns gets me about
> 270ns, and 500ns gets me about 600ns.  So ndelay() is useful only for
> very short delays.

To compensate the error, how about doing the appended?
Yes, this is kind of ugly...

Another point you should be aware.  It looks like arch/powerpc
does not have __ndelay defined.  Which means ndelay() would cause
build error.  Still, I might be missing something.

        Thanks, Akira

diff --git a/kernel/rcu/refperf.c b/kernel/rcu/refperf.c
index 5db165ecd465..0a3764ea220c 100644
--- a/kernel/rcu/refperf.c
+++ b/kernel/rcu/refperf.c
@@ -122,7 +122,7 @@ static void un_delay(const int udl, const int ndl)
        if (udl)
                udelay(udl);
        if (ndl)
-               ndelay(ndl);
+               ndelay((ndl * 859) / 1000); // 5 : 2^32/1000000000 (4.295)
 }
 
 static void ref_rcu_read_section(const int nloops)



