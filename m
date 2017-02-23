Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=MCNNvvqmogfiQgdJRADpN5SyZ76a4fF2QIu/APX/YeA=;
 b=O+GJ9zDKFfZD8jgzk+2H83lPBFp7w3EftSklgDUMXLyjKu9j41fwVBXe7YFPR9Y2l9
 B/bHeoETHIOOhDeOcHyIJEZHQBEyd7WVXBDk36QUhZCVGmT/uho8RCz/Asn1Ta8+/Cia
 h5CM9Ua7zNjbEWDR5m7P+PElOr6EH/Hd+z0BkunMhSg2yRbbvVfRA2VVVANkjAwR7q8r
 KjK/7s+b3ZxnCLaM59eO8Le97ugoqODnhHWDPVRL9AS7+77VEs/Yl2qzYOX6Wfht8vvR
 NK3LuXj3kSlmidLkv0MS1QcFmc3U6cYwxASivEvanh04kOsFG+BWqwZ+Zp5PFpq2LlVc
 e1rQ==
Subject: Re: [Question] Quick Quiz 5.17 and cache coherency
References: <18a02fa0-38f3-fa87-6d68-567b3e812e04@gmail.com>
 <eaeecd61-099f-4c2f-f80a-9d27e28467f8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f4b8eeee-4c00-d725-de23-3e278980949d@gmail.com>
Date: Thu, 23 Feb 2017 23:33:55 +0900
MIME-Version: 1.0
In-Reply-To: <eaeecd61-099f-4c2f-f80a-9d27e28467f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/02/23 22:44:41 +0900, Akira Yokosawa wrote:
> On 2017/02/22 21:22:48 +0800, Yubin Ruan wrote:
>> Hi,
>> I am reading chapter 5 and got confused by the answer to Quick Quiz
>> 5.17. So this is an Array-Based Per-thread Eventually Consistent Counter
>> scheme:
>>
>> 1  DEFINE_PER_THREAD(unsigned long, counter);
>> 2  unsigned long global_count;
>> 3  int stopflag;
>> 4
>> 5  void inc_count(void)
>> 6  {
>> 7      ACCESS_ONCE(__get_thread_var(counter))++;
>> 8  }
>> 9
>> 10 unsigned long read_count(void)
>> 11 {
>> 12     return ACCESS_ONCE(global_count);
>> 13 }
>> 14
>> 15 void *eventual(void *arg)
>> 16 {
>> 17     int t;
>> 18     int sum;
>> 19     while (stopflag < 3) {
>> 20         sum = 0;
>> 21         for_each_thread(t)
>> 22             sum += ACCESS_ONCE(per_thread(counter, t));
>> 23         ACCESS_ONCE(global_count) = sum;
>> 24         poll(NULL, 0, 1);
>> 25         if (stopflag) {
>> 26             smp_mb();
>> 27             stopflag++;
>> 28         }
>> 29     }
>> 30     return NULL;
>> 31 }
>> 32
>> 33 void count_init(void)
>> 34 {
>> 35     thread_id_t tid;
>> 36     if (pthread_create(&tid, NULL, eventual, NULL)) {
>> 37         perror("count_init:pthread_create");
>> 38         exit(-1);
>> 39     }
>> 40 }
>> 41
>> 42 void count_cleanup(void)
>> 43 {
>> 44     stopflag = 1;
>> 45     while (stopflag < 3)
>> 46         poll(NULL, 0, 1);
>> 47     smp_mb();
>> 48 }
>>
>>
>> I understand the code. In Quick Quiz 5.17, the question is:
>>
>>     Why _doesn't_ the `inc_count()' in the code above need to use atomic
>>     instructions? After all, we now have multiple threads accessing the
>>     per-thread counters!
>>
>> I think I know the answer to this question: now that you use per-thread
>> variable, you don't need atomic instructions. The scenarios where you
>> need atomic instructions are some places like this:
>>
>> 1 long counter = 0;
>> 2 void inc_count(void)
>> 3 {
>> 4    counter++;  //need atomic instruction
>> 5 }
>> 6
>> 7 long read_count(void)
>> 8 {
>> 9    return counter;
>> 10}
>>
>>
>> But, the answer provided in the book is:
>>
>> <------------------- Answer Begin ---------------------->
>>     Because one of the two threads only reads, and because
>> the variable is aligned and machine-sized, non-atomic instructions
>> suffice. 
> 
> Well, I think this sentence explains everything necessary. 
> Since the per-thread counters are also read-accessed from eventual() thread,
> the the increment of the count should look "atomic" from eventual().
> If the variable is *not* machine-sized or unaligned, the increment
> access might need multiple read / write accesses and it would be not
> "atomic" from other thread's point of view.

This was somewhat confusing. Let me try again.

Since the per-thread counters are also read-accessed from eventual() thread,
the write access of the increment of the count should look "atomic" from eventual().
If the variable is *not* machine-sized nor aligned, the write of the modified value
might need multiple read / write accesses and they would not be 'atomic" from
other threads' points of view.

Incrementing a counter is a Read-Modify-Write access. In per-thread counter,
it is not necessary to make the whole RMW access atomic. Only the write of the
incremented value needs to look "atomic".

By the way, an "unsigned long" variable is machine-sized and aligned on
most compiler-platform combination, but there might be exceptions I suppose.

                                          Thanks, Akira
> 
> As as side note, you can see the changes made in this Quick Quiz and Answer
> in the git history.  Actually, the original version (dated 2011-01-01,
> git tag:v2011.01.02a) of the Quiz said:
> 
> 	Why does inc_count() in
> 	Figure 5.? (whatever figure number at that time)
> 	need to use atomic instructions?
> 
> This was the opposite of the current version.
> 
>>          That said, the ACCESS_ONCE() macro is used to prevent
>> compiler optimizations that might otherwise prevent the counter
>> updates from becoming visible to eventual() [Cor12].
>>
>>     An older version of this algorithm did in fact use atomic
>> instructions, kudos to Ersoy Bayramoglu for pointing
>> out that they are in fact unnecessary. That said, atomic
>>                                       ~~~~~~~~~~~~~~~~~
>> instructions would be needed in cases where the per-thread
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> counter variables were smaller than the global global_count.
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I suppose Paul added this sentence to explain the case where
> per-thread counter is shorter than machine-size.
> 
> I'm sure Paul will give some comment once he recalls the circumstances ;-)

Now added explicit CC: Paul.

> 
>                                     Thanks, Akira
> 
>> However, note that on a 32-bit system, the per-thread counter
>> variables might need to be limited to 32 bits in order to sum
>> them accurately, but with a 64-bit global_count variable to avoid
>> overflow. In this case, it is necessary to zero the per-thread
>> counter variables periodically in order to avoid overflow. It is
>> extremely important to note that this zeroing cannot be delayed too long
>> or overflow of the smaller per-thread variables will result. This
>> approach therefore imposes real-time requirements on the underlying
>> system, and in turn must be used with extreme care.
>>
>>     In contrast, if all variables are the same size, overflow
>> of any variable is harmless because the eventual sum will
>> be modulo the word size.
>> <------------------------ End -------------------------->
>>
>> Although more complicated than I think, I totally fine with this answer,
>> except the sentence with ~~~ under it. Why is that? Why do we need
>> atomic instructions when counter variables were smaller than the global
>> `global_count' ? Also, the second sentence of the question seems to hint
>> about cache coherency, but I cannot see the point :(
>>
>> regards,
>> Yubin Ruan
>> --
>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

