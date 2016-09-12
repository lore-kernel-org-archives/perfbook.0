Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=oeYEF9IjCZKydSnmDz6PJiDGfCmPnu8vTkHdachiLx4=;
 b=dHQZGY3k8uF+mlzQHvOMDW2fQ99z22rJYJ+35ZtvVzgWES3YnoC/JfI5iFuD1qmOPK
 Y2bjGB9BRvCWYT99NncDVVCmX1x5gp+y1/zenHpFbQKjOHKVJ3nQJP0qWQ059jcdkpkJ
 jmOwuBT2sgEaHeLmV1sLE2QyY/wx2+07eVtsBnLitMSfz6FpA2RdUDBDP00MlTDTA6Ae
 SuTfXbhEzKJbAKwVzEUOVV5sWKvtcfi6uib0a5CblwI+L5tf9bmggV/Q1QJAxACk4XGk
 sglqIuyFaOTGC004mmNIfEZw7QieprEubDESw/evuAJ9eUZqDGxGSaEMNvGgqwJKsl/p
 2lMA==
Subject: Re: [RFC PATCH] toyrcu: Enclose 'verbbox' within 'figure'
References: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
 <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
 <20160908111622.GM3663@linux.vnet.ibm.com>
 <ed8f9798-0ff5-7d96-ef30-b2157af7c4fd@gmail.com>
 <20160910162819.GV32751@linux.vnet.ibm.com>
 <0e40a631-1b13-865a-412b-3e50b532308f@gmail.com>
 <20160912144911.GF3851@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dc704946-85f3-16dd-c6fc-4a5dcb039dbd@gmail.com>
Date: Tue, 13 Sep 2016 00:05:39 +0900
MIME-Version: 1.0
In-Reply-To: <20160912144911.GF3851@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/12 07:49:11 -0700, Paul E. McKenney wrote:
> On Sun, Sep 11, 2016 at 11:49:13AM +0900, Akira Yokosawa wrote:
>> >From 1cbac7a606ed336367529414512d84005f92bf1f Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 11 Sep 2016 11:33:33 +0900
>> Subject: [RFC PATCH] toyrcu: Enclose 'verbbox' within 'figure'
>>
>> Bare "verbbox" environment just after a section heading causes
>> the "afterheading"-ness of the first paragraph.
>> By enclosing the "verbbox" by a "figure" environment, we can
>> avoid the side-effect.
>>
>> This commit does the enclosing by moving \begin{figure} ahead of
>> \begin{verbbox}.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Much better!  Applied, thank you!

Thanks for applying this.
I'll do tree-wide modifications and submit them as a pull request.
Before doing it, I've made a set of scripts to find modification 
candidate. I'm sending them as a patch. They can be used later
to check if any wrong pattern of "verbbox" env might have sneaked in.

                                                   Thanks, Akira 
> 
> 							Thanx, Paul
> 

