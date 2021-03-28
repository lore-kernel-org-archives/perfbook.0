Return-Path: <SRS0=QZ2n=I2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F3IrpQkKxQSd1ZEKev7OD0NDSpcQzW9V6Al03Rm8Y3g=;
        b=VGmADgmEN+ochMmOClMA4v8Woo2R1JDccidA3ftpJvlztpxEVmquTLpZxfrAeFGo4O
         pBrdSGpvTnURmJYQspJ3hj7yCMcnaCSfSBdM5hW0FB29Xl3SA0gJmJv4qhPCUHOT/YRH
         swBJhhbNBjpi2WbvhVE0DtOnr/etd/m6sp1DRne6/nPSNkePx3bUcreL8CrHpSBBMfuc
         pyn98wAQ82C5v5kjBBr4sB6yun1RewCrKzL3kqk1tiCF1cFFM861EfFXJIxIRO/KEGrK
         26VaSzHRIPM9UMOb+AGKi6TX918ZWKkjEa2VwdLn2KHEoxQB52CXjVEAJpxD3avlrbWp
         NZhw==
Subject: Re: [PATCH -perfbook 0/5] Misc fixes and updates
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
 <20210328160836.GT2696@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <418b8e1f-0030-c577-afe8-b868e7e0984f@gmail.com>
Date: Mon, 29 Mar 2021 07:15:17 +0900
MIME-Version: 1.0
In-Reply-To: <20210328160836.GT2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On , Paul E. McKenney wrote:
> On Sun, Mar 28, 2021 at 05:48:14PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This patch set consists of fixes/updates, some of which take care
>> of ebook-size build.
>>
>> Patch 1/5 fixes truncated index pages in ebook-size build.
>> Patch 2/5 adds check of warning messages from makeindex, which are
>> sometimes hard to track down after the fact.
>> Patch 3/5 improves look of final pages of index.
>> I'd like final pages of chapters in two-column layout to be
>> balanced similarly, but have not succeeded.
>> Patch 4/5 fixes the wrong use of \Clnref{} macro, which I failed to
>> catch before the release of Second Edition.
>> Patch 5/5 fixes an orphaned heading of Section B.2 in ebook-size
>> build.
>>
>> To build ebook-size PDF with index pages enabled, use the sequence
>> of command below:
>>
>>     rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix
>>
>> Resulting perfbook-ix.pdf will be of ebook size.
>> As was mentioned earlier, make error due to messages of
>> "LaTeX Warning: Float too large for page by ..." is expected
>> and can be ignored.
> 
> Applied, thank you!
> 
> Just out of curiosity, what must be typed to get an ebook layout with
> index?  My guess of "PERFBOOK_PAPER=EB make ix" did not do the trick.
> Of course, "make ix" continues to create a two-column full-size PDF
> with index.

At the moment, you need to manually remove perfbook-ix.tex
before the rebuild, which is why I wrote:

>>     rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix

above.

I think this can be automated by adding some dependency in the Makefile.
Will look into it later.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>> --
>> Akira Yokosawa (5):
>>   index: Adjust settings respecting ebook-size build
>>   runlatex.sh: Catch warning from makeindex early
>>   index: Enable balanced layout of last page of multi-column index
>>   together: Fix usage of \clnref{} for 'lines M and N'
>>   toyrcu: Move float away from section heading
>>
>>  appendix/toyrcu/toyrcu.tex | 10 +++++-----
>>  perfbook-lt.tex            |  8 +++++---
>>  together/applyrcu.tex      |  2 +-
>>  utilities/runlatex.sh      |  5 +++++
>>  4 files changed, 16 insertions(+), 9 deletions(-)
>>
>> -- 
>> 2.17.1
>>
