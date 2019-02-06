Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F33eOHObLraV+BbsDjHe7/TWXn5aVNlJiEt/prUWeAA=;
        b=Ptho2BL1/ldNmoHHvMTxwdsG7h3P2y6LvzojbHrFGSx80nY8XZb80C8x+wlprfBcXw
         qrIICo7beU5yJVU0bDFEoUkspHZAcKyzLDNt75aStAvHAvYqXYcSNKeS2l6XedwSOi60
         cA+X8NGPl9RKEEO/8xE7g22LyBNP1fzqFAHnJKx25IXTW6s5oPWKdPqNKtlGF4PxORe4
         iEHyD/hmWbZDPSS0nK+L/NhcwqOwXGo924OiH/6l2IDzxrWQN5iHrMh0lML9eq4Dce61
         nMWgUGy0jWClQ9CThMFJdKbASNKiXolmNm9Ty1dXavrR4P4IoCCVpcReCIqfDzZYG3Dr
         9zHw==
Subject: Re: [PATCH 0/6] formal/spinhint: Update code snippet
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
Date: Thu, 7 Feb 2019 07:42:26 +0900
MIME-Version: 1.0
In-Reply-To: <20190202173437.GO4240@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2019/02/02 09:34:37 -0800, Paul E. McKenney wrote:
> On Sun, Feb 03, 2019 at 12:05:32AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Here is another round of code snippet update, with modernization
>> of outputs of Spin and tables of state search results.
>>
>> Patch #1 updates fcvextract.pl so that .spin files are handled
>> as the same as C source files.
>>
>> Patch #2 applies the new scheme to code snippets. It also contains
>> minor changes for better typesetting.
>>
>> Patch #3 replaces captures of Spin outputs with those obtained
>> from Spin version 6.4.8. This commit adds outputs as .lst files
>> under CodeSamples/formal/promela/. They are added to the dependency
>> in the top level Makefile.
>>
>> Patch #4 updates tables of Spin result.  For qrcu.spin, I used
>> the compiler flag -DCOLLAPSE to complete the state search for
>> updaters=3 readers=2 on a machine with 16GB memory. As far as
>> I understand correctly, this compiler flag does not affect the
>> completeness of state search. So I added some explanation in the text
>> to mention the flag and the argument -mN of ./pan to increase the
>> limit of search depth.
>>
>> Patch #5 tweaks footnote on a cell in a table.
>>
>> Patch #6 is a nitpick patch to consistently use \co{}.
>>
>> I'm wondering if Patch #4 is OK from your perspective.
>> Any feedback is welcome!
> 
> Very good, applied and pushed!  I added a small patch on top of Patch #4
> updating the extrapolation.  It was about a terabyte, and is now about
> half that.

Half a terabyte is not prohibitively large these days, and Spin has
another compaction option "-DMA=N" which aggressively reduces memory
consumption in exchange of search speed.

It took three days to complete, with the total memory usage of 6.5GB.
The output looks as follows:

--------
(Spin Version 6.4.6 -- 2 December 2016)
        + Partial Order Reduction
        + Graph Encoding (-DMA=96)

Full statespace search for:
        never claim             - (none specified)
        assertion violations    +
        cycle checks            - (disabled by -DSAFETY)
        invalid end states      +

State-vector 96 byte, depth reached 2055621, errors: 0
MA stats: -DMA=84 is sufficient
Minimized Automaton:    56420520 nodes and 1.75128e+08 edges
9.6647071e+09 states, stored
9.7503813e+09 states, matched
1.9415088e+10 transitions (= stored+matched)
7.2047951e+09 atomic steps

Stats on memory usage (in Megabytes):
1142905.887     equivalent memory usage for states (stored*(State-vector + overhead))
 5448.879       actual memory usage for states (compression: 0.48%)
 1068.115       memory used for DFS stack (-m20000000)
    1.619       memory lost to fragmentation
 6515.375       total actual memory usage


unreached in proctype qrcu_reader
        (0 of 18 states)
unreached in proctype qrcu_updater
        qrcu.spin:102, state 82, "-end-"
        (1 of 82 states)
unreached in init
        (0 of 23 states)

pan: elapsed time 2.72e+05 seconds
pan: rate 35500.523 states/second
--------

I'm not sure if this result is worthy enough to be mentioned
in the text.

Thoughts?

        Thanks, Akira

>            I agree that -DCOLLAPSE is a pure optimization, so it should
> be OK.  If we trust the documentation, anyway!  ;-)
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (6):
>>   fcvextract.pl: Treat '.spin' files as C sources
>>   formal/spinhint: Employ new scheme for code snippet
>>   formal/spinhint: Update output lists of spin
>>   formal/spinhint: Update tables of memory usage of Spin
>>   formal/spinhint: Put footnote on header in table
>>   formal/spinhint: Use \co{...} rather than {\tt ...}
>>
>>  CodeSamples/formal/promela/atomicincrement.spin    |   2 +
>>  .../formal/promela/atomicincrement.spin.lst        |  28 +
>>  CodeSamples/formal/promela/increment.spin          |  46 +-
>>  CodeSamples/formal/promela/increment.spin.lst      |  28 +
>>  .../formal/promela/increment.spin.trail.lst        |  42 +
>>  CodeSamples/formal/promela/lock.h                  |  16 +-
>>  CodeSamples/formal/promela/lock.spin               |  46 +-
>>  CodeSamples/formal/promela/lock.spin.lst           |  29 +
>>  CodeSamples/formal/promela/qrcu.spin               |  95 ++-
>>  Makefile                                           |   4 +-
>>  formal/spinhint.tex                                | 874 ++++++---------------
>>  perfbook.tex                                       |   1 +
>>  utilities/fcvextract.pl                            |   8 +-
>>  13 files changed, 502 insertions(+), 717 deletions(-)
>>  create mode 100644 CodeSamples/formal/promela/atomicincrement.spin.lst
>>  create mode 100644 CodeSamples/formal/promela/increment.spin.lst
>>  create mode 100644 CodeSamples/formal/promela/increment.spin.trail.lst
>>  create mode 100644 CodeSamples/formal/promela/lock.spin.lst
>>
>> -- 
>> 2.7.4
>>
> 

