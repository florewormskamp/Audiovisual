using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MidiJack;

public class noise2 : MonoBehaviour{
public float perlinNoise = 0f;
public float refinement;
public float multiplier;
public int cubes = 50;
public Light lightA, lightB, lightC, lightA1, lightB1, lightC1;
    
    // Start is called before the first frame update
    void Start()
{
   
}

    // Update is called once per frame
 void Update(){

    float multiplier = MidiMaster.GetKnob(0x0A, 0) * 10;
    float refinement = MidiMaster.GetKnob(0x4A, 0) / 10;



for(int i = 0; i < cubes; i++){
     for(int j = 0; j < cubes; j++){
         perlinNoise = Mathf.PerlinNoise(i * refinement, j * refinement);
         GameObject go = GameObject.CreatePrimitive(PrimitiveType.Cube);
         go.transform.position = new Vector3(i, perlinNoise * multiplier, j);
     }
 }

        float x = Random.Range(0f, 50f);
        float y = Random.Range(0f, 30f);
        float z = 25f;

        float x1 = Random.Range(0f, 50f);
        float y1 = Random.Range(0f, 30f);
        float z1 = 25f;

       bool randomize = MidiMaster.GetKeyDown(0x2C);
       bool randomize1 = MidiMaster.GetKeyDown(0x2D);
       bool randomize2= MidiMaster.GetKeyDown(0x2E);
       

		if (randomize)
		{
			float randomHueA = Random.Range(0f, 1f);
		    float randomSaturationA = Random.Range(0f, 1f);
            
			lightA.color = Color.HSVToRGB(randomHueA, randomSaturationA, 1f);

            lightA.transform.SetPositionAndRotation(new Vector3(x, y, z), Quaternion.identity);

            ///////////////////////////////////

            float randomHueA1 = Random.Range(0f, 1f);
		    float randomSaturationA1 = Random.Range(0f, 1f);
            
			lightA1.color = Color.HSVToRGB(randomHueA1, randomSaturationA1, 1f);

            lightA1.transform.SetPositionAndRotation(new Vector3(x1, y1, z1), Quaternion.identity);
		}

        if (randomize1)
		{
			float randomHueB = Random.Range(0f, 1f);
            float randomSaturationB = Random.Range(0f, 1f);
            lightB.color = Color.HSVToRGB(randomHueB, randomSaturationB, 1f); 

            lightB.transform.SetPositionAndRotation(new Vector3(x, y, z), Quaternion.identity); 

            ///////////////////////////////////

            float randomHueB1 = Random.Range(0f, 1f);
		    float randomSaturationB1 = Random.Range(0f, 1f);
            
			lightB1.color = Color.HSVToRGB(randomHueB1, randomSaturationB1, 1f);

            lightB1.transform.SetPositionAndRotation(new Vector3(x1, y1, z1), Quaternion.identity); 
		}

        if (randomize2)
		{
            float randomHueC = Random.Range(0f, 1f);
            float randomSaturationC = Random.Range(0f, 1f);
            lightC.color = Color.HSVToRGB(randomHueC, randomSaturationC, 1f);

            lightC.transform.SetPositionAndRotation(new Vector3(x, y, z), Quaternion.identity);

            ///////////////////////////////////

            float randomHueC1 = Random.Range(0f, 1f);
		    float randomSaturationC1 = Random.Range(0f, 1f);
            
			lightC1.color = Color.HSVToRGB(randomHueC1, randomSaturationC1, 1f);

            lightC1.transform.SetPositionAndRotation(new Vector3(x1, y1, z1), Quaternion.identity);
		}
       } 
    }
