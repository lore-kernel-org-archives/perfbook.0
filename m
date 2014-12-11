Return-Path: <bp@alien8.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418325457; bh=wa5lxD/K9R/lMDssPrfxb5vG3Z426u7EHeyZtCCTv28=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=eziOmG4gZNjB522anuJv/dWGO3D8KQKGAmAysk
 m1CJ81IhiMHnjk2fO4AEH3GpHfSU1Qubhossd87nNrvdOwY+N4Tjw11S+bmTn1ywmYs
 Rcx2LjZrhBeX8jYq13wgLpZJjkjD5Vb7Z+PobJ2Kf69yTIZ4fNVSbnxbyEbee6HPr8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418325456; bh=wa5lxD/K9R/lMDssPrfxb5vG3Z426u7EHeyZtCCTv28=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=jO1hQY1VFh5jCw/qTXVk92ed6slhqtYB2gihrb
 t9sXBulLMw9xQ6RLB9MhxWG1bKhiY0hhMeM2AAqM2W4fvs8WSZoM8iHJMuoTsGpwP/s
 ndPwib6SBww2c7qAZn60Tj+aunJQDwmJdk4wmo785Fo56o7sBWVbAHQsmLKk1gAJO4=
Date: Thu, 11 Dec 2014 20:17:34 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141211191734.GG31140@pd.tnic>
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141211190724.GF31140@pd.tnic>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Great, this moves the error to the next line:

---
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c98f3a78652f..012f815fdd65 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1242,8 +1242,8 @@ but may be implemented straightforwardly as follows:
 	\hline
 	\hline
 	Thread Management
-		& \co{pthread_t}
-			& \co{struct task_struct} \\
+		& pthread\_t
+			& struct task\_struct \\
 	\cline{2-3}
 		& \co{pthread_create()}
 			& \co{kthread_create} \\
--

so it can't stand the {}'s and the _'s all of a sudden.

Or my table format definition is screwed or so after the last update...

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

