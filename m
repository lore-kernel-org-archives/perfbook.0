Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:references:cc:from:to:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=gPx4ErvmGVqWdoFe0v30Gk18Jd8JobYSCoTijfDz91o=;
 b=dSKZdwh/HEZThbpkxFjJW0A3/9yyu+NsD62LKVvjmdNPQPFxZhM2PVwpKmttsb2kZG
 HVxF3XMUa9P0F4aX/r49sZp6IUCU86A5pXUu72mShIsXgZyABsRxy+Wp5Ntg9hmFS/hC
 eWXv7CaC5mD+tKH5HStMKleeYbtse2qx0K2jaGFAL8IJsWTO1dH1EPOeQhPpWsp4isZS
 SKPj7Z7AfimVD5fukd2TsCT/drAHPoGad9VFs5T1du5fZunAy4XqnSGWxnfwKQuuwSe9
 +7egujHmK5wqkmR9G2aoGuxiSiZXyTDPC9yJivl84aFFswOLN/V9mKtBzUNZ7UlruFNF
 Y8Lg==
Subject: [PATCH 0/2] advsync: Use different set of variable names (was Re:
 [PATCH 0/3] Patches for recent updates)
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
 <20161223185842.GB3742@linux.vnet.ibm.com>
 <c7b39cad-90b4-140b-1e62-8d4ddc84f8ff@gmail.com>
 <20161224002217.GE3742@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4d1151a1-49c0-45ad-e4fb-5ee8120e352e@gmail.com>
Date: Sat, 24 Dec 2016 13:21:51 +0900
MIME-Version: 1.0
In-Reply-To: <20161224002217.GE3742@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/12/23 16:22:17 -0800, Paul E. McKenney wrote:
> On Sat, Dec 24, 2016 at 08:56:27AM +0900, Akira Yokosawa wrote:
>> On 2016/12/23 10:58:42 -0800, Paul E. McKenney wrote:
>>> On Fri, Dec 23, 2016 at 05:07:17PM +0900, Akira Yokosawa wrote:
>>>> >From cbb7797d6b307850a280248589bc09b8852e8a68 Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Fri, 23 Dec 2016 16:46:06 +0900
>>>> Subject: [PATCH 0/3] Patches for recent updates
>>>>
>>>> Hi Paul,
>>>>
>>>> This short patch set consists of fixes to recent updates in
>>>> advsync/memorybarriers.
>>>>
>>>> I'm not sure what is your preference of quotation of short variable
>>>> names and keywords. In the 1st patch, I chose the form of ~~\co{a}''.
>>>> If you prefer other one, please let me know.
>>>>
>>>> Ya, I know a variety of styles are mixed-used in perfbook,
>>>> reflecting various original publications...
>>>
>>> My current rule is that an identifier can be mistaken for an English
>>> word or letter of the alphabet, then it should be in double quotation
>>> marks and under \co{}, consistent with your changes.  However, something
>>> like "rcu_node" cannot reasonably be mistaken for English, so it only
>>> needs \co{}.
>>>
>>> Thoughts?
>>
>> So, the cause of potential confusion here is the use of variable name "a",
>> isn't it? If "a" were not there, other variable names b, c, q, x, and y would
>> not need quotation marks, I suppose.
>> "if", "then", and "else" still need quotation.
>>
>> Hmm?
> 
> Indeed, "a" is the main cause of confusion that leads me to believe that
> single-letter variable names need quotes.  Unless the variable names
> are capitalized, in which case "I" is the bad boy.  ;-)

Well, "A" at the begging of a line is also confusing.

So in this case, we have another option to use a different set of variable
names and get rid of quotation marks.
For example, the following patch uses x, y, and z instead of "a", "b",
and "c".  x and y are used in the explanation of transitivity, but
they are not confusing to be used in the first half of this section.

Thoughts?

                                       Thanks, Akira

P.S.
There was another trivial typo. 2nd patch fixes it within this context.

-- 
Akira Yokosawa (2):
  advsync/memorybarriers: Use non-confusing variable names
  advsync/memorybarriers: Fix trivial typo

 advsync/memorybarriers.tex | 98 +++++++++++++++++++++++-----------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

-- 
2.7.4

