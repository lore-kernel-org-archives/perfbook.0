Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=j4BTleaFsur2YkCJ4pBJ250/ZWjQuKT99/hFiuwZY/0=;
 b=Zzym5j98GTPpofjiXLgARseJR2uh+ld4dUJzat7V11hDR28E8xPTT6Q0ifjJ1GBTUO
 Fd7KC/JYliaHOpw4B/T6EN42Ay1anz5eD0nnbORoPKoJ3rt4sx8bByQkpiYri189VAB2
 d3Wof/WKPT4AGxtrJx8I6SY42jXxKu83Rs3h0vp5mCZKIIOR1Pu9bDUrbZFjsDWeDvjP
 SBcE9ZVYk6IqAG7lZe7OY7BB+PlUiN42LSaPM/q/KRmS0ALs23oJWaDQxqBnkZovPav+
 Wq6hP80xQ41SQUdvaIZGZ6M419mxv66kjKNkx+Jde3ffyWvz6qSye1sI5JfIUnJHdT5h
 5oJA==
Subject: Re: [GIT PULL] Another round of qqz improvement
References: <fd3e2eb5-8080-489a-60fa-72836512dd64@gmail.com>
 <20160707024557.GI4650@linux.vnet.ibm.com>
 <38f7bfb9-8532-02fc-524c-bfe0cd9115c6@gmail.com>
 <20160707185228.GL4650@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6d120f0b-09f6-d90a-6969-e12f027b479f@gmail.com>
Date: Sat, 9 Jul 2016 00:54:37 +0900
MIME-Version: 1.0
In-Reply-To: <20160707185228.GL4650@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/08 3:52, Paul E. McKenney wrote:
> On Thu, Jul 07, 2016 at 10:46:18PM +0900, Akira Yokosawa wrote:
>> On 2016/07/06 19:45:57 -0700, Paul E. McKenney wrote:
>>> On Thu, Jul 07, 2016 at 07:29:24AM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> This is another round of qqz improvement.
>>>> 1st and 3rd patch improve vertical spacings in Appendix D.
>>>> 2nd patch modifies the target of back link at the end of QQA
>>>> to the end of QQ in the main text.
>>>> This makes it easier to continue reading after reading an Answer.
>>>> The white box at the end of QQA is added recently, and its change
>>>> in behavior will cause little confusion if any, I think.
>>>
>>> Hello, Akira,
>>>
>>> I applied the first and third, but skipped the second.  I tried it, but
>>> couldn't help thinking that showing the quick quiz upon return might
>>> help with continuity.  "What was I doing again?  Oh, right, I just came
>>> back to the quick quiz on the page."
>>
>> I see. I respect your preference.
>> As a matter of fact, it took a few days for me to get used to the modified
>> behavior. When you expect the behavior, it would feel smoother especially
>> where a Quick Quiz is broken at the bottom of a left column in two column
>> format.
>>
>> Anyway, I agree with you that current behavior is suitable as a default.
>
> I do plan to do another release soon, and the release note will highlight
> Paolo's and your work on this.  So let's see what the readers think!

Oh, that would be of my great pleasure!

And how soon would the release be?
I'm preparing a (hopefully) final round of cosmetic fixes.
It's getting larger than I expected. I need to cleanup the commits to
distinguish actual fixes of something from just cosmetic ones so that you can
review them easily.  It may take another week or so.

                                                   Thanks, Akira
>
> 							Thanx, Paul
>
>>>> ---
>>>> The following changes since commit 22af283e2a52cdf4a1c944fc97f00ce6a7a25ef8:
>>>>
>>>>  Add diagnostics to route_rcu to reliably detect use-after-free (2016-07-05 15:52:16 -0700)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>  https://github.com/akiyks/perfbook.git qqz-use-vspace
>>>>
>>>> for you to fetch changes up to 746d78491c4dc47bcf72bfaf23724d568582d192:
>>>>
>>>>  qqz: Give room for \parskip to suppress orphans (2016-07-07 07:07:17 +0900)
>>>>
>>>> ----------------------------------------------------------------
>>>> Akira Yokosawa (3):
>>>>      qqz: Use \vspace{} for vertical spacing in Appendix D.
>>>>      qqz: Modify back link target at end of QQA to end of QQ
>>>>      qqz: Give room for \parskip to suppress orphans
>>>>
>>>> qqz.sty | 22 +++++++++++++++++-----
>>>> 1 file changed, 17 insertions(+), 5 deletions(-)
>>>>
>>>
>>>
>>
>
>

