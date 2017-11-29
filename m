Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=47wH46IIR9+rW6t8qGgOfPf/M5el5iw4ITtG8spIIdY=;
 b=g4DJBXLDTjCIkAeRqN09Cp5PAHL+J/TZQbEafPZg8juPmzZoejMP8Trwf8s7ig1tgr
 8pfHWbeLsvAtQ/YzeNXHNTcyLVHlBAWoaP8fYnKUPRYBKI07o537/cl8HHYd3YvTNhs6
 KmjGkBRxehsjBI8s+rpz8CgOkntRu6785PnXCU4iS4BIv9nSq2yH56FERho4xCA36zr6
 8ViDLgZq3FpmZgpc+2K4qr15pzVhb1TOyxmbaOWD75ONBe5I20QdBs5ZsIfK3D7r5AjC
 cMCUfOodpnlMZJXDpHLQDrYwT3FvXKRsCEsZwh/AZFmHMlyOfXBs94ICL0gjnvu5nMhx
 Oinw==
Subject: Re: [PATCH] CodeSamples/formal/herd: Remove dependency to memory
 model in cross-klitmus
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
 <436dc15a-073d-adec-3fd6-92633bd93041@gmail.com>
 <7350c9f9-6f73-3a00-eee6-239889f93d37@gmail.com>
 <20171126184024.GC3624@linux.vnet.ibm.com>
 <f323d375-0088-c125-d149-fb6168756b35@gmail.com>
 <20171129003113.GA3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c9fcf8f4-f4f4-e5de-151f-919fe1443eca@gmail.com>
Date: Thu, 30 Nov 2017 00:24:26 +0900
MIME-Version: 1.0
In-Reply-To: <20171129003113.GA3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/28 16:31:13 -0800, Paul E. McKenney wrote:
> On Wed, Nov 29, 2017 at 12:24:32AM +0900, Akira Yokosawa wrote:
>> On 2017/11/26 10:40:24 -0800, Paul E. McKenney wrote:
>>> On Thu, Nov 23, 2017 at 12:17:57PM +0900, Akira Yokosawa wrote:
>>>> >From 62491d966a645d08ffc6bb0c5bae9f725458cbec Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Thu, 23 Nov 2017 12:07:18 +0900
>>>> Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to memory model in cross-klitmus
>>>>
>>>> Target "cross-klitmus" does not depend on memory model.
>>>> Remove the implicit dependency of "cd $(LKMM_DIR)" from the recipe.
>>>>
>>>> Fixes: ef76630632df ("CodeSamples/formal/herd: Add Makefile and utility script")
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>
>>> I applied and pushed both, the first just before the release and the one
>>> below as the first commit after the release.
>>>
>>> I also attached the (very crude) scripts that I use to collect herd
>>> performance data, just in case they are useful.
>>
>> Well, I have no idea how to use absperf-reduce.sh.
>> It's partly because I'm not good at awk, but I can't figure out what kind of
>> input and arguments the script assumes.
> 
> Good point...
> 
>> Can you show me an example?
>>
>> I know absperf.sh runs each litmus test 10 times with timeout of 15 minutes.
>>
>> I'd be happy to integrate the collection feature into formal/herd/Makefile,
>> once I know what is expected.
> 
> So you run absperf.sh and feed its output into absperf-reduce.sh as
> its standard input.
> 
> I normally dump the absperf.sh to a file and then run absperf-reduce.sh
> on that file.  The output is the litmus-test name followed by the
> average, minimum, and maximum runtimes for that litmus test.
> 
> One oddity is that both scripts expect the scripts to be in the
> directory litmus-tests/absperf -- this is hard-coded into absperf.sh's
> for-loop and into the first pattern of absperf-reduce.sh's awk script
> (the "/^litmus-tests/ {" line).

Ah, this is the key point I could not figure out.
Now I can run the scripts using short litmus tests.

We also need memory model files in the current directory.

So the current scheme in CodeSamples/formal/herd/ of "cd memory-model; herd7 ..."
conflicts with the above assumption.

Let me think what approach is suitable for perfbook's CodeSamples.
This may take a while.

       Thanks, Akira

> 
> So here is how the absperf-reduce.sh script operates, in the likely
> event that you would prefer to just rewrite it (which would be fine
> by me):
> 
> o	Each awk statement block is preceded by a pattern, and
> 	contains a "{}"-enclosed sequence of statements.  These
> 	statements are executed only when the pattern matches the
> 	current line.  The special pattern "END" executes after
> 	the input has been consumed and processed.
> 
> o	The "/^litmus-tests/" matches lines beginning with "litmus-tests".
> 	These lines are those "echo"ed by absperf.sh.  This check
> 	relies on the fact that herd7 doesn't output lines beginning
> 	with "litmus-tests", which is admittedly a very fragile
> 	approach.
> 
> 	Upon match, the variable "curtest" is set to the first word
> 	on the current line (which is the litmus-test pathname)
> 	and the variable "testrun" is set to zero to say that we
> 	do not yet have any evidence that the test ran to completion.
> 
> o	The "/^Test/" is output by herd7, and indicates that the
> 	litmus test actually completed.  So we set "testran" to 1.
> 
> o	The "/maxresident)k/" matches output from /bin/time.  If
> 	herd7 ran, the following lines parse the /bin/time output,
> 	and accumulate the number of runs, the total time, and
> 	the minimum and maximum time in awk associative arrays.
> 
> 	(In awk, 'a["efwefew"]++' is a perfectly valid expression,
> 	and it increments the element of "a" indexed by the string
> 	"efwefew".  I am pretty sure that most scripting languages
> 	do this these days, but it was pretty surprising back when
> 	awk came out with it.)
> 
> o	The "END" loops through all elements of the array, with
> 	the variable "i" taking on each index of that array in
> 	turn.  The print statement thus prints the litmus test
> 	name along with its statistics.
> 
> I then hand-edited the output to make various tables in email and Table
> 12.3 in perfbook.
> 
> Why awk?  Back when I was starting scripting languages, it was the only
> one availalble on UNIX.  This would have been some time in the 1980s.
> It is very unlikely to be the best choice for someone starting out
> today.  ;-)
> 
> 							Thanx, Paul
> 
> 

