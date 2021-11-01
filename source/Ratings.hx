import flixel.FlxG;

class Ratings
{
	public static function GenerateLetterRank(accuracy:Float) // generate a letter ranking
	{
		var ranking:String = "Unknown";

		if (PlayState.misses == 0) // S
			ranking = "S";
		else if (PlayState.misses < 10) // A
			ranking = "A";
		else if (PlayState.misses < 25) // B
			ranking = "B";
		else if (PlayState.misses < 50) // C
			ranking = "C";
		else if (PlayState.misses < 80) // D
			ranking = "D";
		else
			ranking = "F";

		// WIFE TIME :)))) (based on Wife3)

		var wifeConditions:Array<Bool> = [accuracy >= 75, // +
			accuracy >= 25, // /
			accuracy < 25, // -
		];

		for (i in 0...wifeConditions.length)
		{
			var b = wifeConditions[i];
			if (b)
			{
				switch (i)
				{
					case 0:
						ranking += "+";
					case 1:
						ranking += "";
					case 2:
						ranking += "-";
				}
				break;
			}
		}

		if (accuracy == 0)
			ranking = "??";
		if (FlxG.save.data.botplay && !PlayState.loadRep)
			ranking = "Otto mode! <3";

		return ranking;
	}

	public static var timingWindows = [];

	public static function judgeNote(noteDiff:Float)
	{
		var diff = Math.abs(noteDiff);
		for (index in 0...timingWindows.length) // based on 4 timing windows, will break with anything else
		{
			var time = timingWindows[index];
			var nextTime = index + 1 > timingWindows.length - 1 ? 0 : timingWindows[index + 1];
			if (diff < time && diff >= nextTime)
			{
				switch (index)
				{
					case 0: // shit
						return "shit";
					case 1: // bad
						return "bad";
					case 2: // good
						return "good";
					case 3: // sick
						return "sick";
				}
			}
		}
		return "good";
	}

	public static function CalculateRanking(score:Int, scoreDef:Int, nps:Int, maxNPS:Int, accuracy:Float):String
	{
		return (FlxG.save.data.npsDisplay ? // NPS Toggle
			"NPS: "
			+ nps
			+ " (Max "
			+ maxNPS
			+ ")"
			+ (!PlayStateChangeables.botPlay || PlayState.loadRep ? " | " : "") : "") + // 	NPS
			(!PlayStateChangeables.botPlay
				|| PlayState.loadRep ? "Score:" + (Conductor.safeFrames != 10 ? score + " (" + scoreDef + ")" : "" + score) + // Score
					(FlxG.save.data.accuracyDisplay ? // Accuracy Toggle
						" | Misses:"
						+ PlayState.misses
						+ // 	Misses/Combo Breaks
						" | Accuracy:"
						+ (PlayStateChangeables.botPlay && !PlayState.loadRep ? "N/A" : HelperFunctions.truncateFloat(accuracy, 2) + " %")
						+ // 	Accuracy
						" | "
						+ GenerateLetterRank(accuracy) : "") : ""); // 	Letter Rank
	}
}
